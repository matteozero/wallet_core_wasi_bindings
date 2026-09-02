import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_wasi_bindings/wallet_core_wasi_bindings.dart';
import 'package:wasm_run/wasm_run.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('WalletCoreWasiWasm.initialize() with NO explicit wasmBytes -- loads the bundled package asset', () async {
    await WasmRunLibrary.setUp(
      lib: ExternalLibrary.open(
        '/Users/lightningx/Working/aiworking/walletcore/wasm_run/target/release/libwasm_run_dart.dylib',
      ),
    );

    // No wasmBytes: must resolve via rootBundle from
    // wallet_core_wasi_bindings_wasm_assets's own bundled asset.
    await WalletCoreWasiWasm.initialize();

    final wallet = TWHDWallet.create(128, '');
    final mnemonic = wallet.mnemonic;
    print('mnemonic (default asset path): $mnemonic');
    expect(mnemonic.split(' ').length, 12);
    wallet.delete();

    print('DEFAULT ASSET SMOKE TEST PASSED');
  });
}
