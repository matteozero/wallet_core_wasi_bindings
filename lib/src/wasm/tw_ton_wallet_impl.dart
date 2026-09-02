part of '../../wallet_core_wasi_bindings.dart';

class TWTONWalletImpl extends TWTONWalletInterface {
  TWTONWalletImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int buildV4R2StateInit(int publicKey, int workchain, int walletId) => wasm.callInt('TWTONWalletBuildV4R2StateInit', [publicKey, workchain, walletId]);

  @override
  int buildV5R1StateInit(int publicKey, int workchain, int walletId) => wasm.callInt('TWTONWalletBuildV5R1StateInit', [publicKey, workchain, walletId]);

}
