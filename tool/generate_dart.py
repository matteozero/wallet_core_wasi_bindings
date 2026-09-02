#!/usr/bin/env python3
"""
Generates the mechanical bulk of the single wallet_core_wasi_bindings Dart
package (api layer + wasm impl layer) for every TW* class/enum discovered by
extract.py, EXCEPT TWString and TWData which are hand-written (see
lib/src/tw_{string,data}*.dart and lib/src/wasm/tw_{string,data}_impl.dart)
since they're the two foundational marshaling primitives everything else
composes on top of.
"""
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from dart_types import high_level_type, low_level_type, normalize_variant

ROOT = Path(__file__).parent.parent
API_SRC = ROOT / "lib" / "src"
WASM_SRC = ROOT / "lib" / "src" / "wasm"

HAND_WRITTEN = {"TWString", "TWData"}

DART_RESERVED = {
    "default", "class", "enum", "in", "is", "new", "this", "super", "with",
    "extends", "return", "if", "else", "for", "while", "do", "switch", "case",
    "break", "continue", "true", "false", "null", "void", "var", "final",
    "const", "static", "abstract", "assert", "async", "await", "yield",
    "import", "export", "library", "part", "typedef", "operator", "get", "set",
    "throw", "try", "catch", "finally", "rethrow", "as", "show", "hide",
}


def lower_camel(name: str) -> str:
    if not name:
        return name
    out = name[0].lower() + name[1:]
    if out in DART_RESERVED:
        out += "_"
    return out


def strip_prefix_lower_camel(enum_name: str, variant_name: str) -> str:
    """Manifest enum variants already come pre-shortened + lowerCamel (e.g.
    TWCoinType's 'bitcoin'). Direct-parsed ones are still the full prefixed C
    name (e.g. TWFiroAddressTypeDefault) and need the class name prefix
    stripped, then lowerCamel'd."""
    if variant_name.startswith(enum_name) and variant_name != enum_name:
        rest = variant_name[len(enum_name):]
        return lower_camel(rest)
    return lower_camel(variant_name)


def snake_case(name: str) -> str:
    """Every class starts with 'TW'; strip it and snake_case the rest with an
    acronym-safe algorithm (a naive per-uppercase-letter split would turn
    TWHDWallet/TWFIOAccount/TWAES into t_w_h_d_wallet.dart-style garbage)."""
    rest = name[2:] if name.startswith("TW") else name
    s = re.sub(r"(.)([A-Z][a-z]+)", r"\1_\2", rest)
    s = re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", s)
    return "tw_" + s.lower()


class ClassModel:
    def __init__(self, name, raw, is_manifest):
        self.name = name
        self.raw = raw
        self.is_manifest = is_manifest
        structs = raw.get("structs", []) or []
        enums = raw.get("enums", []) or []
        self.own_struct = next(
            (s for s in structs if s["name"] == name and s.get("is_class")), None
        )
        self.own_enum = next((e for e in enums if e["name"] == name), None)
        # `params` is omitted entirely from manifest YAML when empty (serde's
        # skip_serializing_if = "Vec::is_empty"), so normalize it to always
        # be present rather than scattering .get("params", []) everywhere.
        for item in (raw.get("inits", []) or []) + (raw.get("functions", []) or []) + (
            raw.get("properties", []) or []
        ):
            item.setdefault("params", [])
        self.inits = raw.get("inits", []) or []
        self.deinits = raw.get("deinits", []) or []
        # is_public:false marks internal helpers not meant for external
        # consumers (verified: exactly 2 across the whole dataset, both in
        # TWHRP.yaml, both plain un-decorated C functions with no
        # TW_EXPORT_*/TW_VISIBILITY_DEFAULT/extern marker at all -- consistent
        # with wallet-core's own team already excluding them from the public
        # API surface).
        self.functions = [f for f in (raw.get("functions", []) or []) if f.get("is_public", True)]
        self.properties = [p for p in (raw.get("properties", []) or []) if p.get("is_public", True)]

    @property
    def is_class(self):
        return self.own_struct is not None

    @property
    def is_enum(self):
        return self.own_enum is not None

    @property
    def delete_name(self):
        if self.deinits:
            return self.deinits[0]["name"]
        return None


def has_bindable_content(raw: dict) -> bool:
    return any(raw.get(k) for k in ("structs", "enums", "inits", "deinits", "functions", "properties"))


def load_classes():
    data = json.loads((Path(__file__).parent / "extracted.json").read_text())
    classes = {}
    for name, raw in data["manifests"].items():
        # 44 manifests describe *only* `protos:` (documentation-only type
        # aliases for TWData*, e.g. TWAeternityProto's SigningInput/Output --
        # not a bindable class/enum/function at all; verified count via
        # extract.py's own proto-alias detection).
        if not has_bindable_content(raw):
            continue
        classes[name] = ClassModel(name, raw, True)
    for name, raw in data["direct"].items():
        if name in HAND_WRITTEN:
            continue
        classes[name] = ClassModel(name, raw, False)
    return classes


def dart_string_lit(comments):
    if not comments:
        return ""
    text = " ".join(comments).strip()
    text = text.replace("\\", "\\\\").replace("*/", "* /")
    return f"/// {text}\n" if text else ""


def marshal_in(param_name: str, type_info: dict) -> tuple[str, str, str | None]:
    """Returns (setup_code, arg_expr, temp_name_needing_delete_or_None) to
    turn a high-level Dart value into what's actually passed to the
    interface call. Interface params are bool/double passthrough, int for
    everything pointer/enum-like -- see low_level_type."""
    variant = normalize_variant(type_info["variant"])
    nullable = type_info.get("is_nullable", False)
    if variant == "string":
        tmp = f"_{param_name}Str"
        if nullable:
            return (
                f"final {tmp} = {param_name} == null ? null : TWString({param_name});\n",
                f"{tmp}?.pointer ?? 0",
                tmp,
            )
        return (f"final {tmp} = TWString({param_name});\n", f"{tmp}.pointer", tmp)
    if variant == "data":
        tmp = f"_{param_name}Data"
        if nullable:
            return (
                f"final {tmp} = {param_name} == null ? null : TWData({param_name});\n",
                f"{tmp}?.pointer ?? 0",
                tmp,
            )
        return (f"final {tmp} = TWData({param_name});\n", f"{tmp}.pointer", tmp)
    if variant == "struct":
        if nullable:
            return ("", f"{param_name}?.pointer ?? 0", None)
        return ("", f"{param_name}.pointer", None)
    if variant == "enum":
        return ("", f"{param_name}.value", None)
    if variant == "char" and type_info.get("is_pointer"):
        # Raw (non-TWString) `const char*` params need real wasm-memory
        # marshaling (malloc+write), which only the impl layer can do -- not
        # reachable in practice: the only 2 functions with this shape
        # (TWHRP's stringForHRP/hrpForString) are is_public:false and
        # filtered out entirely (see ClassModel). Fail loudly if that
        # invariant ever changes rather than silently emit broken Dart.
        raise NotImplementedError(
            f"raw char* param {param_name!r} needs hand-written marshaling; "
            "add the owning class to HAND_WRITTEN or extend marshal_in"
        )
    # bool/double/plain-int params pass straight through unchanged -- no
    # marshaling needed, and critically no bool->int coercion here: the
    # interface's own param type is already `bool` for a bool param (see
    # low_level_type), matching what's passed. The int-list-of-args wasm
    # call itself (which really does need 0/1) is built in generate_impl,
    # not here.
    return ("", param_name, None)


def marshal_out(expr: str, type_info: dict, *, nullable: bool) -> str:
    variant = normalize_variant(type_info["variant"])
    if variant == "string":
        if nullable:
            return f"(({expr}) == 0 ? null : TWString.fromPointer({expr}).value)"
        return f"TWString.fromPointer({expr}).value"
    if variant == "data":
        if nullable:
            return f"(({expr}) == 0 ? null : TWData.fromPointer({expr}).bytes)"
        return f"TWData.fromPointer({expr}).bytes"
    if variant == "struct":
        cls = type_info["value"]
        if nullable:
            return f"(({expr}) == 0 ? null : {cls}.fromPointer({expr}))"
        return f"{cls}.fromPointer({expr})"
    if variant == "enum":
        cls = type_info["value"]
        return f"{cls}.fromValue({expr})"
    if variant == "char" and type_info.get("is_pointer"):
        # See the matching NotImplementedError in marshal_in -- same
        # reasoning applies to raw char* returns.
        raise NotImplementedError(
            "raw char* return needs hand-written marshaling; add the owning "
            "class to HAND_WRITTEN or extend marshal_out"
        )
    return expr


def render_params_high(params, skip_first=False):
    ps = params[1:] if skip_first else params
    return ", ".join(f"{high_level_type(p['type'])} {lower_camel(p['name'])}" for p in ps)


def render_params_low(params, skip_first=False):
    ps = params[1:] if skip_first else params
    return ", ".join(f"{low_level_type(p['type'])} {lower_camel(p['name'])}" for p in ps)


def render_call_args(params, skip_first=False, self_expr=None):
    """Returns (setup_lines, [arg_exprs], [(temp_name, is_nullable)]) ready to
    pass straight to the interface call (which is bool/double passthrough,
    int for pointer/enum-likes -- no bool->int coercion here; that only
    happens at the impl layer's raw wasm call, see generate_impl)."""
    setup = []
    args = []
    temps = []
    if self_expr is not None:
        args.append(self_expr)
    ps = params[1:] if skip_first else params
    for p in ps:
        name = lower_camel(p["name"])
        setup_code, arg_expr, temp = marshal_in(name, p["type"])
        if setup_code:
            setup.append(setup_code)
        if temp:
            temps.append((temp, p["type"].get("is_nullable", False)))
        args.append(arg_expr)
    return setup, args, temps


def emit_interface_method_sig(fn, class_model):
    """Low-level abstract interface method: always ints/bool/double, self
    (if any) as the first param named 'pointer'."""
    name = lower_camel(fn["name"][len(class_model.name):] or fn["name"])
    ret = low_level_type(fn["return_type"])
    params = fn["params"]
    parts = []
    for p in params:
        parts.append(f"{low_level_type(p['type'])} {lower_camel(p['name'])}")
    return f"{ret} {name}({', '.join(parts)});"


def method_short_name(full_name: str, class_name: str) -> str:
    if full_name.startswith(class_name):
        rest = full_name[len(class_name):]
    else:
        rest = full_name
    return lower_camel(rest) if rest else lower_camel(full_name)


def generate_interface(cm: ClassModel) -> str:
    lines = [f"part of '../../wallet_core_wasi_bindings.dart';", "", f"abstract class {cm.name}Interface {{"]
    for init in cm.inits:
        name = method_short_name(init["name"], cm.name)
        params = ", ".join(f"{low_level_type(p['type'])} {lower_camel(p['name'])}" for p in init["params"])
        lines.append(f"  int {name}({params});")
    if cm.delete_name:
        lines.append("  void delete(int pointer);")
    for fn in cm.functions:
        lines.append("  " + emit_interface_method_sig(fn, cm))
    for prop in cm.properties:
        name = method_short_name(prop["name"], cm.name)
        extra_params = ", ".join(
            f"{low_level_type(p['type'])} {lower_camel(p['name'])}" for p in prop.get("params", [])
        )
        params = "int pointer" + (", " + extra_params if extra_params else "")
        lines.append(f"  {low_level_type(prop['return_type'])} {name}({params});")
    lines.append("}")
    return "\n".join(lines) + "\n"


def generate_enum(cm: ClassModel) -> str:
    variants = cm.own_enum["variants"]
    seen_names = set()
    lines = [f"part of '../../wallet_core_wasi_bindings.dart';", "", f"enum {cm.name} {{"]
    entries = []
    for v in variants:
        dart_name = strip_prefix_lower_camel(cm.name, v["name"])
        base = dart_name
        i = 2
        while dart_name in seen_names:
            dart_name = f"{base}{i}"
            i += 1
        seen_names.add(dart_name)
        entries.append((dart_name, v["value"]))
    for dart_name, value in entries:
        lines.append(f"  {dart_name}({value}),")
    lines.append(f"  ;")
    lines.append("")
    lines.append("  const {}(this.value);".format(cm.name))
    lines.append("  final int value;")
    lines.append("")
    lines.append(f"  static {cm.name} fromValue(int value) =>")
    lines.append(f"      {cm.name}.values.firstWhere((e) => e.value == value);")
    lines.append("}")
    return "\n".join(lines) + "\n"


def generate_wrapper(cm: ClassModel) -> str:
    lines = [f"part of '../wallet_core_wasi_bindings.dart';", ""]
    iface = f"{cm.name}Interface"
    getter = f"_{lower_camel(cm.name)}Impl"
    lines.append(f"{iface} get {getter} => WalletCoreWasiBindings.backend<{iface}>();")
    lines.append("")

    if cm.is_class:
        finalizer = f"_{lower_camel(cm.name)}Finalizer"
        if cm.delete_name:
            lines.append(f"final Finalizer<int> {finalizer} = Finalizer<int>((pointer) {{")
            lines.append(f"  {getter}.delete(pointer);")
            lines.append("});")
            lines.append("")
        lines.append(f"class {cm.name} extends TWObjectFinalizable {{")
        # Constructors from inits.
        used_ctor_names = set()
        for init in cm.inits:
            raw_name = method_short_name(init["name"], cm.name)
            ctor_name = raw_name if raw_name not in used_ctor_names and raw_name != "" else f"create{raw_name[0:1].upper()}{raw_name[1:]}"
            used_ctor_names.add(ctor_name)
            params_high = ", ".join(
                f"{high_level_type(p['type'])} {lower_camel(p['name'])}" for p in init["params"]
            )
            setup, args, temps = render_call_args(init["params"])
            setup_code = "".join(setup)
            call_expr = f"{getter}.{method_short_name(init['name'], cm.name)}({', '.join(args)})"
            nullable = init.get("is_nullable", False)
            ctor_label = f".{ctor_name}" if ctor_name != cm.name and ctor_name else ""
            if setup_code or temps:
                body = [f"  factory {cm.name}{ctor_label}({params_high}) {{"]
                body.append(f"    {setup_code}")
                body.append(f"    final _ptr = {call_expr};")
                for t, t_nullable in temps:
                    body.append(f"    {t}{'?' if t_nullable else ''}.delete();")
                if nullable:
                    body.append("    if (_ptr == 0) throw StateError('{} failed');".format(init["name"]))
                body.append(f"    return {cm.name}.fromPointer(_ptr);")
                body.append("  }")
                lines.extend(body)
            else:
                lines.append(f"  factory {cm.name}{ctor_label}({params_high}) {{")
                lines.append(f"    final _ptr = {call_expr};")
                if nullable:
                    lines.append("    if (_ptr == 0) throw StateError('{} failed');".format(init["name"]))
                lines.append(f"    return {cm.name}.fromPointer(_ptr);")
                lines.append("  }")
            lines.append("")
        if cm.delete_name:
            lines.append(
                f"  {cm.name}.fromPointer(int pointer) : super(pointer, finalizer: {finalizer});"
            )
        else:
            lines.append(f"  {cm.name}.fromPointer(int pointer) : super(pointer);")
        lines.append("")
    else:
        lines.append(f"class {cm.name} {{")
        lines.append(f"  {cm.name}._();")
        lines.append("")

    # Static + instance functions.
    for fn in cm.functions:
        name = method_short_name(fn["name"], cm.name)
        is_static = fn.get("is_static", True) or not cm.is_class
        params = fn["params"]
        skip_first = cm.is_class and not is_static
        params_high = render_params_high(params, skip_first=skip_first)
        ret_high = high_level_type(fn["return_type"])
        self_expr = "pointer" if skip_first else None
        setup, args, temps = render_call_args(params, skip_first=skip_first, self_expr=self_expr)
        low_ret_nullable = fn["return_type"].get("is_nullable", False)
        call_expr = f"{getter}.{name}({', '.join(args)})"
        static_kw = "static " if is_static else ""
        setup_code = "".join(setup)
        out_expr = marshal_out("_r", fn["return_type"], nullable=low_ret_nullable)
        is_void = normalize_variant(fn["return_type"]["variant"]) == "void"
        lines.append(f"  {static_kw}{ret_high} {name}({params_high}) {{")
        if setup_code:
            lines.append(f"    {setup_code}")
        if is_void:
            lines.append(f"    {call_expr};")
        else:
            lines.append(f"    final _r = {call_expr};")
        for t, t_nullable in temps:
            lines.append(f"    {t}{'?' if t_nullable else ''}.delete();")
        if not is_void:
            lines.append(f"    return {out_expr};")
        lines.append("  }")
        lines.append("")

    # Properties (getters), always instance-level (implicit self).
    for prop in cm.properties:
        name = method_short_name(prop["name"], cm.name)
        ret_high = high_level_type(prop["return_type"])
        extra_params = prop.get("params", [])
        if extra_params:
            # A handful of "properties" take extra params beyond self; model
            # as a method, not a getter, since Dart getters can't take args.
            params_high = render_params_high(extra_params)
            setup, args, temps = render_call_args(extra_params, self_expr="pointer")
            call_expr = f"{getter}.{name}({', '.join(args)})"
            lines.append(f"  {ret_high} {name}({params_high}) {{")
            for s in setup:
                lines.append(f"    {s}")
            lines.append(f"    final _r = {call_expr};")
            for t, t_nullable in temps:
                lines.append(f"    {t}{'?' if t_nullable else ''}.delete();")
            lines.append(
                f"    return {marshal_out('_r', prop['return_type'], nullable=prop['return_type'].get('is_nullable', False))};"
            )
            lines.append("  }")
        else:
            call_expr = f"{getter}.{name}(pointer)"
            out_expr = marshal_out(
                "_r", prop["return_type"], nullable=prop["return_type"].get("is_nullable", False)
            )
            lines.append(f"  {ret_high} get {name} {{")
            lines.append(f"    final _r = {call_expr};")
            lines.append(f"    return {out_expr};")
            lines.append("  }")
        lines.append("")

    if cm.is_class and cm.delete_name:
        lines.append(f"  void delete() => disposeWith({getter}.delete);")

    lines.append("}")
    return "\n".join(lines) + "\n"


def impl_call_arg_exprs(params, leading=()):
    """Args for the raw wasm.callX(...) call: wasm i32 <-> Dart int only
    (see wasm_run's WasmVal.i32(int)), so a bool param -- which the
    interface itself takes/returns as a real Dart bool, matching
    low_level_type -- needs a `? 1 : 0` coercion right here, at the one
    point it actually crosses into a wasm call."""
    exprs = list(leading)
    for p in params:
        name = lower_camel(p["name"])
        if normalize_variant(p["type"]["variant"]) == "bool":
            exprs.append(f"({name} ? 1 : 0)")
        else:
            exprs.append(name)
    return ", ".join(exprs)


def generate_impl(cm: ClassModel) -> str:
    lines = [f"part of '../../wallet_core_wasi_bindings.dart';", "", f"class {cm.name}Impl extends {cm.name}Interface {{"]
    lines.append(f"  {cm.name}Impl(this.wasm);")
    lines.append("  final WasiReactorModule wasm;")
    lines.append("")
    for init in cm.inits:
        name = method_short_name(init["name"], cm.name)
        params = ", ".join(f"{low_level_type(p['type'])} {lower_camel(p['name'])}" for p in init["params"])
        arg_names = impl_call_arg_exprs(init["params"])
        lines.append(f"  @override")
        lines.append(f"  int {name}({params}) => wasm.callInt('{init['name']}', [{arg_names}]);")
        lines.append("")
    if cm.delete_name:
        lines.append("  @override")
        lines.append(f"  void delete(int pointer) => wasm.callVoid('{cm.delete_name}', [pointer]);")
        lines.append("")
    for fn in cm.functions:
        name = method_short_name(fn["name"], cm.name)
        params = ", ".join(f"{low_level_type(p['type'])} {lower_camel(p['name'])}" for p in fn["params"])
        arg_names = impl_call_arg_exprs(fn["params"])
        variant = normalize_variant(fn["return_type"]["variant"])
        low_ret = low_level_type(fn["return_type"])
        lines.append("  @override")
        if variant == "void":
            lines.append(f"  void {name}({params}) => wasm.callVoid('{fn['name']}', [{arg_names}]);")
        elif variant == "bool":
            lines.append(f"  bool {name}({params}) => wasm.callBool('{fn['name']}', [{arg_names}]);")
        elif variant in ("float", "double"):
            lines.append(f"  double {name}({params}) => wasm.callDouble('{fn['name']}', [{arg_names}]);")
        else:
            lines.append(f"  {low_ret} {name}({params}) => wasm.callInt('{fn['name']}', [{arg_names}]);")
        lines.append("")
    for prop in cm.properties:
        name = method_short_name(prop["name"], cm.name)
        extra = prop.get("params", [])
        params = "int pointer" + ("".join(f", {low_level_type(p['type'])} {lower_camel(p['name'])}" for p in extra))
        arg_names = impl_call_arg_exprs(extra, leading=["pointer"])
        variant = normalize_variant(prop["return_type"]["variant"])
        low_ret = low_level_type(prop["return_type"])
        lines.append("  @override")
        if variant == "bool":
            lines.append(f"  bool {name}({params}) => wasm.callBool('{prop['name']}', [{arg_names}]);")
        elif variant in ("float", "double"):
            lines.append(f"  double {name}({params}) => wasm.callDouble('{prop['name']}', [{arg_names}]);")
        else:
            lines.append(f"  {low_ret} {name}({params}) => wasm.callInt('{prop['name']}', [{arg_names}]);")
        lines.append("")
    lines.append("}")
    return "\n".join(lines) + "\n"


def main():
    classes = load_classes()
    api_parts = []
    wasm_parts = []
    registry_entries = []

    interface_dir = API_SRC / "interface"
    interface_dir.mkdir(parents=True, exist_ok=True)
    WASM_SRC.mkdir(parents=True, exist_ok=True)

    for name in sorted(classes):
        cm = classes[name]
        stem = snake_case(name)

        if cm.is_enum and not cm.is_class:
            enum_path = API_SRC / f"{stem}.dart"
            enum_path.write_text(generate_enum(cm))
            api_parts.append(f"src/{stem}.dart")
            continue

        iface_path = interface_dir / f"{stem}_interface.dart"
        iface_path.write_text(generate_interface(cm))
        api_parts.append(f"src/interface/{stem}_interface.dart")

        wrapper_path = API_SRC / f"{stem}.dart"
        wrapper_path.write_text(generate_wrapper(cm))
        api_parts.append(f"src/{stem}.dart")

        impl_path = WASM_SRC / f"{stem}_impl.dart"
        impl_path.write_text(generate_impl(cm))
        wasm_parts.append(f"src/wasm/{stem}_impl.dart")
        registry_entries.append((f"{name}Interface", f"{name}Impl"))

    print(f"Generated {len(classes)} classes.")
    print(f"api parts: {len(api_parts)}, wasm parts: {len(wasm_parts)}")

    # Write registry list + part directives to stitch into the two library
    # files (kept separate from the hand-written parts already present).
    (Path(__file__).parent / "generated_api_parts.txt").write_text("\n".join(sorted(api_parts)))
    (Path(__file__).parent / "generated_wasm_parts.txt").write_text("\n".join(sorted(wasm_parts)))
    (Path(__file__).parent / "generated_registry_entries.txt").write_text(
        "\n".join(f"{iface}: {impl}(wasm)," for iface, impl in sorted(registry_entries))
    )


if __name__ == "__main__":
    main()
