part of '../../wallet_core_wasi_bindings.dart';

/// Entry point: loads and instantiates the wallet-core WASI reactor module
/// and registers every generated `TWXxxImpl` with
/// [WalletCoreWasiBindings].
class WalletCoreWasiWasm {
  WalletCoreWasiWasm._();

  static bool _initialized = false;

  /// Compiles and instantiates the wallet-core wasm module (loaded from
  /// [wasmBytes], or from this package's own bundled asset if omitted) and
  /// registers all backend implementations. Safe to call more than once --
  /// later calls are a no-op.
  static Future<void> initialize({Uint8List? wasmBytes}) async {
    if (_initialized) return;

    final bytes =
        wasmBytes ??
        (await rootBundle.load(
          'packages/wallet_core_wasi_bindings/assets/wasm/wallet-core-wasi.wasm',
        )).buffer.asUint8List();

    final module = await compileWasmModule(
      bytes,
      config: const ModuleConfig(
        wasmtime: ModuleConfigWasmtime(),
      ),
    );
    final builder = module.builder(
      wasiConfig: const WasiConfig(preopenedDirs: [], webBrowserFileSystem: {}),
    );
    // wasm_run's builder.build() already auto-invokes `_initialize` for a
    // parameterless-export reactor module (WASI reactor convention: run C++
    // global constructors once before any other exported function is
    // called) -- calling it again here would run global constructors twice.
    final instance = await builder.build();

    final wasm = WasiReactorModule(instance);
    WalletCoreWasiBindings.register(buildBackendRegistry(wasm));
    _initialized = true;
  }
}
