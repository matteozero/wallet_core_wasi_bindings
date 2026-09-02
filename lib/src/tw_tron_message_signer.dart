part of '../wallet_core_wasi_bindings.dart';

TWTronMessageSignerInterface get _tWTronMessageSignerImpl => WalletCoreWasiBindings.backend<TWTronMessageSignerInterface>();

class TWTronMessageSigner {
  TWTronMessageSigner._();

  static String signMessage(TWPrivateKey privateKey, String message) {
    final _messageStr = TWString(message);

    final _r = _tWTronMessageSignerImpl.signMessage(privateKey.pointer, _messageStr.pointer);
    _messageStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static bool verifyMessage(TWPublicKey pubKey, String message, String signature) {
    final _messageStr = TWString(message);
final _signatureStr = TWString(signature);

    final _r = _tWTronMessageSignerImpl.verifyMessage(pubKey.pointer, _messageStr.pointer, _signatureStr.pointer);
    _messageStr.delete();
    _signatureStr.delete();
    return _r;
  }

}
