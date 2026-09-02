"""Type-mapping rules shared by every emitter: how a C-ABI TypeInfo maps onto
(a) the low-level int-pointer Dart signature used at the wasm call boundary,
and (b) the high-level ergonomic Dart type a consumer actually sees."""

UINT_ALIASES = {
    "uint8_t": "uint8_t",
    "u_int8_t": "uint8_t",
    "uint16_t": "uint16_t",
    "u_int16_t": "uint16_t",
    "uint32_t": "uint32_t",
    "u_int32_t": "uint32_t",
    "uint64_t": "uint64_t",
    "u_int64_t": "uint64_t",
}


def normalize_variant(variant: str) -> str:
    return UINT_ALIASES.get(variant, variant)


def class_name_for_struct(raw: str) -> str:
    """Manifest struct/enum 'value' names are already the real TW* identifier."""
    return raw


def low_level_type(type_info: dict) -> str:
    """The Dart type used in the abstract interface / wasm impl signatures --
    i.e. exactly what's passed across the wasm call boundary. Every pointer
    (string/data/struct) and every enum is an int (a linear-memory address or
    an integer discriminant); every integer width narrower than 64 bits is
    still plain Dart `int`; bool/double pass through."""
    variant = normalize_variant(type_info["variant"])
    if variant in ("string", "data", "struct"):
        return "int"
    if variant == "enum":
        return "int"
    if variant == "char" and type_info.get("is_pointer"):
        return "int"
    if variant == "bool":
        return "bool"
    if variant in ("float", "double"):
        return "double"
    if variant == "void":
        return "void"
    # int, int8_t..int64_t, uint8_t..uint64_t, size_t, short_int, long_int, unsigned_int, char (non-pointer)
    return "int"


def high_level_type(type_info: dict, *, nullable_override: bool = None) -> str:
    """The ergonomic Dart-facing type used in the hand-friendly wrapper API."""
    variant = normalize_variant(type_info["variant"])
    nullable = type_info.get("is_nullable", False) if nullable_override is None else nullable_override
    suffix = "?" if nullable else ""
    if variant == "string":
        return f"String{suffix}"
    if variant == "data":
        return f"Uint8List{suffix}"
    if variant == "struct":
        return f"{class_name_for_struct(type_info['value'])}{suffix}"
    if variant == "enum":
        return f"{class_name_for_struct(type_info['value'])}{suffix}"
    if variant == "char" and type_info.get("is_pointer"):
        return f"String{suffix}"
    if variant == "bool":
        return "bool"
    if variant in ("float", "double"):
        return "double"
    if variant == "void":
        return "void"
    return "int"


def needs_uint64_warning(type_info: dict) -> bool:
    return normalize_variant(type_info["variant"]) == "uint64_t"
