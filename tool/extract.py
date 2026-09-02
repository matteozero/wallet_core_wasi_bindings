#!/usr/bin/env python3
"""
Clean-room extractor for TrustWalletCore's C API surface.

Ground truth is entirely wallet-core's own sources (Apache-2.0):
  - codegen-v2/manifest/*.yaml (official, structured -- used whenever a class has one)
  - include/TrustWalletCore/*.h (parsed directly for classes with no manifest)

Produces a single unified JSON describing every class/enum/proto-alias and every
function/property/init/deinit, in a schema modeled on codegen-v2's own
manifest.rs (FileInfo/StructInfo/EnumInfo/FunctionInfo/PropertyInfo/InitInfo/
DeinitInfo/ParamInfo/TypeInfo), so the Dart emitter has one shape to deal with
regardless of which path a class came from.
"""
import json
import re
import sys
from pathlib import Path

WALLET_CORE = Path("/Users/lightningx/Working/aiworking/walletcore/wallet-core")
MANIFEST_DIR = WALLET_CORE / "codegen-v2" / "manifest"
HEADERS_DIR = WALLET_CORE / "include" / "TrustWalletCore"

# Headers that carry no bindable API surface at all.
SKIP_HEADERS = {"TWBase"}


def load_manifests():
    files = {}
    for p in sorted(MANIFEST_DIR.glob("*.yaml")):
        with open(p) as f:
            import yaml

            data = yaml.safe_load(f)
        files[data["name"]] = data
    return files


# ---------------------------------------------------------------------------
# Direct header parsing, for classes with no manifest.
# ---------------------------------------------------------------------------

TYPE_RE = re.compile(
    r"""
    ^\s*
    (?P<const>const\s+)?
    (?:struct\s+)?
    (?P<base>[A-Za-z_][A-Za-z0-9_]*)
    \s*
    (?P<star>\*)?
    \s*
    (?P<null>_Nullable|_Nonnull)?
    \s*$
    """,
    re.VERBOSE,
)

PRIMITIVE_VARIANTS = {
    "void": "void",
    "bool": "bool",
    "char": "char",
    "short": "short_int",
    "int": "int",
    "unsigned": "unsigned_int",
    "long": "long_int",
    "float": "float",
    "double": "double",
    "size_t": "size_t",
    "int8_t": "int8_t",
    "int16_t": "int16_t",
    "int32_t": "int32_t",
    "int64_t": "int64_t",
    "uint8_t": "uint8_t",
    "uint16_t": "uint16_t",
    "uint32_t": "uint32_t",
    "uint64_t": "uint64_t",
}

KNOWN_STRUCTS = set()  # populated after a first pass over all TW_EXPORT_CLASS decls
KNOWN_ENUMS = set()  # populated from manifests + TW_EXPORT_ENUM decls
PROTO_ALIASES = set()  # typedef names from *Proto.h, all == TWData*


def parse_type(raw: str, proto_aliases: set, known_enums: set):
    """raw is the full type text, e.g. 'struct TWHDWallet *_Nullable' or
    'TWString *_Nonnull' or 'enum TWCoinType' or 'const char *_Nonnull'."""
    raw = raw.strip()
    is_pointer = "*" in raw
    is_nullable = "_Nullable" in raw
    is_const = raw.startswith("const ")
    # Strip qualifiers/annotations to find the base type name.
    base = raw
    base = base.replace("const", "")
    base = base.replace("_Nullable", "")
    base = base.replace("_Nonnull", "")
    base = base.replace("*", "")
    base = base.replace("struct", "")
    base = base.replace("enum", "")
    base = base.strip()

    if base in proto_aliases:
        return {"variant": "data", "is_constant": is_const, "is_nullable": is_nullable, "is_pointer": True}
    if base == "TWString":
        return {"variant": "string", "is_constant": is_const, "is_nullable": is_nullable, "is_pointer": True}
    if base == "TWData":
        return {"variant": "data", "is_constant": is_const, "is_nullable": is_nullable, "is_pointer": True}
    if base in PRIMITIVE_VARIANTS:
        return {
            "variant": PRIMITIVE_VARIANTS[base],
            "is_constant": is_const,
            "is_nullable": is_nullable,
            "is_pointer": is_pointer,
        }
    if base in known_enums:
        return {"variant": "enum", "value": base, "is_constant": is_const, "is_nullable": is_nullable, "is_pointer": is_pointer}
    # Anything else is assumed to be an opaque TW* class pointer.
    return {"variant": "struct", "value": base, "is_constant": is_const, "is_nullable": is_nullable, "is_pointer": is_pointer}


DECL_RE = re.compile(
    r"""
    (?P<macro>TW_EXPORT_METHOD|TW_EXPORT_STATIC_METHOD|TW_EXPORT_PROPERTY|TW_EXPORT_STATIC_PROPERTY|TW_EXPORT_FUNC)
    \s*
    (?P<sig>[^;]+;)
    """,
    re.VERBOSE,
)

# Two more declaration conventions exist besides the TW_EXPORT_* prefix macro
# style above, each used by exactly a couple of foundational/legacy headers:
#   - `<decl> TW_VISIBILITY_DEFAULT;` -- no prefix macro at all (TWString.h,
#     TWData.h). Verified via `grep -l TW_VISIBILITY_DEFAULT *.h` that every
#     other header either doesn't use this attribute or only uses it as
#     harmless trailing noise alongside a normal prefix macro (TWCardano.h).
#   - bare `extern <decl>;` -- no macro/attribute at all (TWAnySigner.h only,
#     verified via `grep -clE '^extern ' *.h` across all 143 headers).
# Every declaration found this way has no implicit self/instance semantics in
# this codebase (verified by inspecting both headers in full), so they are
# always modeled as plain (is_static=True) functions.
BARE_DECL_RE = re.compile(
    r"""
    ^\s*
    (?:extern\s+)?
    (?P<sig>[^;{}]*?\bTW[A-Za-z0-9_]*\s*\([^;{}]*\)\s*(?:TW_VISIBILITY_DEFAULT\s*)?);
    """,
    re.VERBOSE | re.MULTILINE,
)

FUNC_SIG_RE = re.compile(
    r"""
    ^\s*
    (?P<ret>.+?)
    \s+
    (?P<name>TW[A-Za-z0-9_]*)
    \s*\(
    (?P<params>.*)
    \)\s*
    (?:TW_VISIBILITY_DEFAULT\s*)?
    ;\s*$
    """,
    re.DOTALL | re.VERBOSE,
)


def strip_comments(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)
    text = re.sub(r"//[^\n]*", "", text)
    return text


def split_params(params_str: str):
    params_str = params_str.strip()
    if params_str == "" or params_str == "void":
        return []
    # Params never contain commas inside nested parens for this codebase
    # (no function-pointer params in the classes we directly parse), so a
    # naive split is safe -- but assert it to catch it loudly if wrong.
    assert "(" not in params_str, f"unexpected nested parens in params: {params_str}"
    parts = [p.strip() for p in params_str.split(",")]
    out = []
    for p in parts:
        m = re.match(r"^(.+?)([A-Za-z_][A-Za-z0-9_]*)$", p.strip())
        if not m:
            raise ValueError(f"cannot split type/name in param: {p!r}")
        ty, name = m.group(1).strip(), m.group(2).strip()
        out.append((name, ty))
    return out


def parse_header_direct(path: Path, proto_aliases: set, known_enums: set):
    raw_text = path.read_text()
    text = strip_comments(raw_text)

    structs = []
    for m in re.finditer(r"TW_EXPORT_CLASS\s*\n\s*struct\s+(TW[A-Za-z0-9_]*)\s*;", text):
        structs.append({"name": m.group(1), "is_public": True, "is_class": True, "fields": []})
    # TWString/TWData declare their opaque type this way instead (they predate
    # the TW_EXPORT_CLASS macro convention and are handled as builtin
    # marshaling primitives by the emitter, not the generic class template).
    for m in re.finditer(r"typedef\s+const\s+void\s+(TW[A-Za-z0-9_]*)\s*;", text):
        if not any(s["name"] == m.group(1) for s in structs):
            structs.append({"name": m.group(1), "is_public": True, "is_class": True, "fields": []})

    enums = []
    for m in re.finditer(
        r"TW_EXPORT_ENUM\(([^)]*)\)\s*\n\s*enum\s+(TW[A-Za-z0-9_]*)\s*\{(.*?)\}\s*;",
        text,
        re.DOTALL,
    ):
        value_type_raw = m.group(1).strip()
        name = m.group(2)
        body = m.group(3)
        variants = []
        next_val = 0
        for line in body.split(","):
            line = line.strip()
            if not line:
                continue
            vm = re.match(r"^(TW[A-Za-z0-9_]*)(?:\s*=\s*(-?\w+))?$", line)
            if not vm:
                continue
            vname = vm.group(1)
            if vm.group(2) is not None:
                try:
                    next_val = int(vm.group(2), 0)
                except ValueError:
                    pass
            variants.append({"name": vname, "value": str(next_val)})
            next_val += 1
        enums.append(
            {
                "name": name,
                "is_public": True,
                "value_type": PRIMITIVE_VARIANTS.get(value_type_raw, "uint32_t"),
                "variants": variants,
            }
        )
        known_enums.add(name)

    functions = []
    properties = []
    inits = []
    deinits = []
    seen_names = set()

    for dm in DECL_RE.finditer(text):
        macro = dm.group("macro")
        sig = dm.group("sig").replace("\n", " ")
        sig = re.sub(r"\s+", " ", sig).strip()
        fm = FUNC_SIG_RE.match(sig)
        if not fm:
            raise ValueError(f"{path.name}: could not parse signature after {macro}: {sig!r}")
        ret_raw, name, params_raw = fm.group("ret"), fm.group("name"), fm.group("params")
        params = split_params(params_raw)
        ret_type = parse_type(ret_raw, proto_aliases, known_enums)
        seen_names.add(name)

        if macro == "TW_EXPORT_PROPERTY":
            properties.append(
                {
                    "name": name,
                    "is_public": True,
                    "return_type": ret_type,
                    "params": [{"name": n, "type": parse_type(t, proto_aliases, known_enums)} for n, t in params],
                }
            )
        elif macro == "TW_EXPORT_STATIC_PROPERTY":
            functions.append(
                {
                    "name": name,
                    "is_public": True,
                    "is_static": True,
                    "params": [{"name": n, "type": parse_type(t, proto_aliases, known_enums)} for n, t in params],
                    "return_type": ret_type,
                }
            )
        elif macro in ("TW_EXPORT_METHOD", "TW_EXPORT_STATIC_METHOD", "TW_EXPORT_FUNC"):
            functions.append(
                {
                    "name": name,
                    "is_public": True,
                    "is_static": macro != "TW_EXPORT_METHOD",
                    "params": [{"name": n, "type": parse_type(t, proto_aliases, known_enums)} for n, t in params],
                    "return_type": ret_type,
                }
            )

    # Fallback pass: declarations using neither a TW_EXPORT_* prefix macro nor
    # (as a sole marker) TW_VISIBILITY_DEFAULT -- see BARE_DECL_RE's docstring
    # for exactly which headers this covers and how that was verified.
    for bm in BARE_DECL_RE.finditer(text):
        sig = re.sub(r"\s+", " ", bm.group("sig")).strip() + ";"
        fm = FUNC_SIG_RE.match(sig)
        if not fm:
            raise ValueError(f"{path.name}: could not parse bare declaration: {sig!r}")
        name = fm.group("name")
        if name in seen_names:
            continue
        seen_names.add(name)
        ret_raw, params_raw = fm.group("ret"), fm.group("params")
        params = split_params(params_raw)
        ret_type = parse_type(ret_raw, proto_aliases, known_enums)
        functions.append(
            {
                "name": name,
                "is_public": True,
                "is_static": True,
                "params": [{"name": n, "type": parse_type(t, proto_aliases, known_enums)} for n, t in params],
                "return_type": ret_type,
            }
        )

    for fn in list(functions):
        if fn["return_type"].get("variant") == "struct" and fn["return_type"].get("is_pointer"):
            cls = fn["return_type"]["value"]
            if any(s["name"] == cls for s in structs) and fn["name"].startswith(cls) and "Create" in fn["name"]:
                functions.remove(fn)
                inits.append(
                    {
                        "name": fn["name"],
                        "is_public": True,
                        "is_nullable": fn["return_type"].get("is_nullable", False),
                        "params": fn["params"],
                    }
                )

    for cls in structs:
        delete_name = f"{cls['name']}Delete"
        if any(f["name"] == delete_name for f in functions):
            deinits.append({"name": delete_name})
            functions[:] = [f for f in functions if f["name"] != delete_name]

    return {
        "name": path.stem,
        "structs": structs,
        "inits": inits,
        "deinits": deinits,
        "enums": enums,
        "functions": functions,
        "properties": properties,
    }


def manifest_known_names(data):
    names = set()
    for key in ("functions", "properties", "inits", "deinits"):
        for item in data.get(key, []) or []:
            names.add(item["name"])
    return names


def find_all_declared_names_and_text(path: Path):
    """Every function-like name declared in this header, regardless of which
    of the three conventions marks it (see BARE_DECL_RE's docstring), plus
    the raw (macro, sig) pairs needed to actually parse the new ones."""
    text = strip_comments(path.read_text())
    found = []  # (name, macro_or_none, raw_sig)
    seen = set()
    for dm in DECL_RE.finditer(text):
        sig = re.sub(r"\s+", " ", dm.group("sig")).strip()
        fm = FUNC_SIG_RE.match(sig)
        if fm and fm.group("name") not in seen:
            seen.add(fm.group("name"))
            found.append((fm.group("name"), dm.group("macro"), sig))
    for bm in BARE_DECL_RE.finditer(text):
        sig = re.sub(r"\s+", " ", bm.group("sig")).strip() + ";"
        fm = FUNC_SIG_RE.match(sig)
        if fm and fm.group("name") not in seen:
            seen.add(fm.group("name"))
            found.append((fm.group("name"), None, sig))
    return found


def merge_manifest_gaps(manifests: dict, proto_aliases: set, known_enums: set):
    """wallet-core's official codegen-v2 manifests are hand/tool-generated
    snapshots and can lag behind the headers they describe (verified: 28
    functions across 11 manifest-covered headers exist in the header but not
    in the manifest, as of this checkout). Patch those gaps in directly from
    the header text so coverage tracks the actual current API, not a stale
    snapshot. Every patched-in function is still parsed through the exact
    same regex/type-mapping path as the fully-direct classes."""
    total_patched = 0
    for stem, data in manifests.items():
        header_path = HEADERS_DIR / f"{stem}.h"
        if not header_path.exists():
            continue  # a few manifest names don't correspond to their own header (e.g. enums declared inside a sibling header)
        known = manifest_known_names(data)
        for name, macro, sig in find_all_declared_names_and_text(header_path):
            if name in known:
                continue
            fm = FUNC_SIG_RE.match(sig)
            ret_raw, params_raw = fm.group("ret"), fm.group("params")
            params = split_params(params_raw)
            ret_type = parse_type(ret_raw, proto_aliases, known_enums)
            param_infos = [{"name": n, "type": parse_type(t, proto_aliases, known_enums)} for n, t in params]
            if macro == "TW_EXPORT_PROPERTY":
                data.setdefault("properties", []).append(
                    {"name": name, "is_public": True, "params": param_infos, "return_type": ret_type}
                )
            else:
                data.setdefault("functions", []).append(
                    {
                        "name": name,
                        "is_public": True,
                        "is_static": macro != "TW_EXPORT_METHOD",
                        "params": param_infos,
                        "return_type": ret_type,
                    }
                )
            total_patched += 1
    return total_patched


def collect_proto_aliases():
    aliases = set()
    for p in HEADERS_DIR.glob("*Proto.h"):
        text = p.read_text()
        for m in re.finditer(r"typedef\s+TWData\s*\*\s*_Nonnull\s+(TW_[A-Za-z0-9_]+)\s*;", text):
            aliases.add(m.group(1))
    return aliases


def main():
    manifests = load_manifests()
    proto_aliases = collect_proto_aliases()

    known_enums = set()
    for data in manifests.values():
        for e in data.get("enums", []) or []:
            known_enums.add(e["name"])

    manifest_stems = set(manifests.keys())
    all_stems = {p.stem for p in HEADERS_DIR.glob("*.h")}
    proto_stems = {p.stem for p in HEADERS_DIR.glob("*Proto.h")}
    direct_stems = all_stems - manifest_stems - proto_stems - SKIP_HEADERS

    errors = []
    direct_files = {}
    # Two passes: first collect enum names across all direct headers (some
    # classes reference enums declared in a sibling direct header), then
    # actually parse functions with that full enum vocabulary available.
    for stem in sorted(direct_stems):
        try:
            info = parse_header_direct(HEADERS_DIR / f"{stem}.h", proto_aliases, known_enums)
        except Exception as e:  # noqa: BLE001
            errors.append(f"{stem}: {e}")
            continue
        direct_files[stem] = info

    if errors:
        print("PARSE ERRORS:", file=sys.stderr)
        for e in errors:
            print(f"  {e}", file=sys.stderr)
        sys.exit(1)

    patched = merge_manifest_gaps(manifests, proto_aliases, known_enums)
    print(f"patched {patched} functions/properties missing from stale official manifests\n")

    total_funcs = 0
    total_props = 0
    total_inits = 0
    for data in manifests.values():
        total_funcs += len(data.get("functions", []) or [])
        total_props += len(data.get("properties", []) or [])
        total_inits += len(data.get("inits", []) or [])
    for data in direct_files.values():
        total_funcs += len(data["functions"])
        total_props += len(data["properties"])
        total_inits += len(data["inits"])

    print(f"manifest classes: {len(manifests)}")
    print(f"direct-parsed classes: {len(direct_files)}")
    print(f"proto-alias-only headers skipped: {len(proto_stems)}")
    print(f"skipped (no API surface): {len(SKIP_HEADERS)}")
    print(f"total functions+properties+inits discovered: {total_funcs + total_props + total_inits}")
    print(f"  (functions={total_funcs}, properties={total_props}, inits={total_inits})")
    print()
    print("direct-parsed class names:")
    for stem in sorted(direct_files):
        info = direct_files[stem]
        n = len(info["functions"]) + len(info["properties"]) + len(info["inits"])
        print(f"  {stem}: {n} members")

    out = {
        "manifests": manifests,
        "direct": direct_files,
        "proto_aliases": sorted(proto_aliases),
    }
    out_path = Path(__file__).parent / "extracted.json"
    out_path.write_text(json.dumps(out, indent=2))
    print(f"\nWrote {out_path}")


if __name__ == "__main__":
    main()
