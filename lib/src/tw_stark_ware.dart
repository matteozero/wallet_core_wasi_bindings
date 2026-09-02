part of '../wallet_core_wasi_bindings.dart';

TWStarkWareInterface get _tWStarkWareImpl => WalletCoreWasiBindings.backend<TWStarkWareInterface>();

class TWStarkWare {
  TWStarkWare._();

  static TWPrivateKey getStarkKeyFromSignature(TWDerivationPath derivationPath, String signature) {
    final _signatureStr = TWString(signature);

    final _r = _tWStarkWareImpl.getStarkKeyFromSignature(derivationPath.pointer, _signatureStr.pointer);
    _signatureStr.delete();
    return TWPrivateKey.fromPointer(_r);
  }

}
