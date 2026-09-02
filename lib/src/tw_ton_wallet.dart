part of '../wallet_core_wasi_bindings.dart';

TWTONWalletInterface get _tWTONWalletImpl => WalletCoreWasiBindings.backend<TWTONWalletInterface>();

class TWTONWallet extends TWObjectFinalizable {
  TWTONWallet.fromPointer(int pointer) : super(pointer);

  static String? buildV4R2StateInit(TWPublicKey publicKey, int workchain, int walletId) {
    final _r = _tWTONWalletImpl.buildV4R2StateInit(publicKey.pointer, workchain, walletId);
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? buildV5R1StateInit(TWPublicKey publicKey, int workchain, int walletId) {
    final _r = _tWTONWalletImpl.buildV5R1StateInit(publicKey.pointer, workchain, walletId);
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

}
