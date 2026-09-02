part of '../wallet_core_wasi_bindings.dart';

TWTONMessageSignerInterface get _tWTONMessageSignerImpl => WalletCoreWasiBindings.backend<TWTONMessageSignerInterface>();

class TWTONMessageSigner extends TWObjectFinalizable {
  TWTONMessageSigner.fromPointer(int pointer) : super(pointer);

  static String? signMessage(TWPrivateKey privateKey, String message) {
    final _messageStr = TWString(message);

    final _r = _tWTONMessageSignerImpl.signMessage(privateKey.pointer, _messageStr.pointer);
    _messageStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

}
