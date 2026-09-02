# wallet_core_wasi_bindings

Clean-room Dart bindings for [TrustWalletCore](https://github.com/trustwallet/wallet-core)'s
C API (`TW*` functions), with a built-in [wasm_run](https://github.com/juancastillo0/wasm_run)
/ WASI backend that runs TrustWalletCore compiled as a standalone **WASI reactor
module** (via `wasi-sdk`, with real wasm exceptions enabled) instead of Emscripten.

This gets you the full TrustWalletCore API — address derivation, transaction
signing, mnemonics, HD wallets, 130+ chains — as pure Dart, running the actual
upstream C++/Rust core compiled to wasm, with no platform channels, no
Emscripten JS glue, and no native FFI bindings to maintain per platform.

## How it's generated

Ground truth is entirely wallet-core's own sources (Apache-2.0):

- `codegen-v2/manifest/*.yaml` — official, structured API manifests (used
  whenever a class has one)
- `include/TrustWalletCore/*.h` — parsed directly for classes with no manifest

`tool/extract.py` walks both into one unified JSON describing every
class/enum/proto-alias and every function/property/init/deinit.
`tool/generate_dart.py` then emits the mechanical bulk of this package (the
public API layer under `lib/src/*.dart` and the wasm marshaling layer under
`lib/src/wasm/*_impl.dart`) from that JSON. `TWString` and `TWData` are
hand-written instead, since they're the two foundational marshaling
primitives everything else composes on top of.

Re-run the pipeline after pulling in a newer wallet-core:

```bash
python3 tool/extract.py
python3 tool/generate_dart.py
```

## Install

Not published to pub.dev — depend on it via git, alongside the `wasm_run`
fork it needs for the WASI backend:

```yaml
dependencies:
  wallet_core_wasi_bindings:
    git:
      url: https://github.com/matteozero/wallet_core_wasi_bindings.git
  wasm_run:
    git:
      url: https://github.com/matteozero/wasm_run.git
      ref: feature/wasmtime-exceptions
      path: packages/wasm_run
```

## Usage

```dart
import 'package:wallet_core_wasi_bindings/wallet_core_wasi_bindings.dart';

// Loads the wallet-core-wasi.wasm asset bundled with this package.
await WalletCoreWasiWasm.initialize();

final wallet = TWHDWallet.create(128, '');
print(wallet.mnemonic); // 12-word mnemonic
wallet.delete();
```

See `test/` for further smoke tests covering proto-based transaction signing,
foundation types (`TWString`/`TWData`), and the generated bindings at large.

## License

This package's own code is MIT licensed (see `LICENSE`). It links against and
bundles a WASI build of TrustWalletCore (`assets/wasm/wallet-core-wasi.wasm`),
which is Apache-2.0 licensed by Trust Wallet — see
[trustwallet/wallet-core](https://github.com/trustwallet/wallet-core) for its
license and copyright notices.
