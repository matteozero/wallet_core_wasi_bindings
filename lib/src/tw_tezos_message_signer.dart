part of '../wallet_core_wasi_bindings.dart';

TWTezosMessageSignerInterface get _tWTezosMessageSignerImpl => WalletCoreWasiBindings.backend<TWTezosMessageSignerInterface>();

class TWTezosMessageSigner {
  TWTezosMessageSigner._();

  static String formatMessage(String message, String url) {
    final _messageStr = TWString(message);
final _urlStr = TWString(url);

    final _r = _tWTezosMessageSignerImpl.formatMessage(_messageStr.pointer, _urlStr.pointer);
    _messageStr.delete();
    _urlStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String inputToPayload(String message) {
    final _messageStr = TWString(message);

    final _r = _tWTezosMessageSignerImpl.inputToPayload(_messageStr.pointer);
    _messageStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String signMessage(TWPrivateKey privateKey, String message) {
    final _messageStr = TWString(message);

    final _r = _tWTezosMessageSignerImpl.signMessage(privateKey.pointer, _messageStr.pointer);
    _messageStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static bool verifyMessage(TWPublicKey pubKey, String message, String signature) {
    final _messageStr = TWString(message);
final _signatureStr = TWString(signature);

    final _r = _tWTezosMessageSignerImpl.verifyMessage(pubKey.pointer, _messageStr.pointer, _signatureStr.pointer);
    _messageStr.delete();
    _signatureStr.delete();
    return _r;
  }

}
