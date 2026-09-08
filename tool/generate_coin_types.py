#!/usr/bin/env python3
"""
Generates lib/src/tw_coin_type.dart directly from wallet-core's own
include/TrustWalletCore/TWCoinType.h enum.

This is intentionally separate from extract.py/generate_dart.py: those parse
codegen-v2/manifest/*.yaml + the rest of include/TrustWalletCore/*.h for
TW* *classes* (functions/properties/inits). TWCoinType.h is a flat C enum of
coin constants with no manifest of its own -- registry.json is the more
complete source of coin metadata but doesn't enumerate the C enum identifiers
themselves, so this reads the header directly.

Naming: strips the TWCoinType prefix and lowercases just the first character
(TWCoinTypeFetchAI -> fetchAI, TWCoinTypeEOS -> eOS), matching
generate_dart.py's lower_camel()/strip_prefix_lower_camel() used for every
other enum in this package, for consistency across the generated API surface.
"""
import re
from pathlib import Path

WALLET_CORE = Path("/Users/lightningx/Working/aiworking/walletcore/wallet-core")
HEADER = WALLET_CORE / "include" / "TrustWalletCore" / "TWCoinType.h"
OUT = Path(__file__).parent.parent / "lib" / "src" / "tw_coin_type.dart"

ENTRY_RE = re.compile(r"TWCoinType([A-Za-z0-9]+)\s*=\s*(-?\d+)\s*,")


def lower_camel(name: str) -> str:
    if not name:
        return name
    return name[0].lower() + name[1:]


def main():
    if not HEADER.exists():
        raise RuntimeError(f"{HEADER} not found -- check WALLET_CORE at the top of this file")

    entries = ENTRY_RE.findall(HEADER.read_text())
    if not entries:
        raise RuntimeError(f"no TWCoinType entries found in {HEADER}")

    lines = ["part of '../../wallet_core_wasi_bindings.dart';", "", "enum TWCoinType {"]
    seen = set()
    for raw_name, value in entries:
        name = lower_camel(raw_name)
        if name in seen:
            raise RuntimeError(f"duplicate TWCoinType Dart identifier {name!r} (from TWCoinType{raw_name})")
        seen.add(name)
        lines.append(f"  {name}({value}),")
    lines += [
        "  ;",
        "",
        "  const TWCoinType(this.value);",
        "  final int value;",
        "",
        "  static TWCoinType fromValue(int value) =>",
        "      TWCoinType.values.firstWhere((e) => e.value == value);",
        "}",
    ]

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text("\n".join(lines) + "\n")
    print(f"Generated {len(entries)} TWCoinType entries -> {OUT.relative_to(OUT.parent.parent.parent)}")


if __name__ == "__main__":
    main()
