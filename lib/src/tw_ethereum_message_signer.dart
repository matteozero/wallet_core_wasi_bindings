part of '../wallet_core_wasi_bindings.dart';

TWEthereumMessageSignerInterface get _tWEthereumMessageSignerImpl => WalletCoreWasiBindings.backend<TWEthereumMessageSignerInterface>();

class TWEthereumMessageSigner {
  TWEthereumMessageSigner._();

  static String signTypedMessage(TWPrivateKey privateKey, String messageJson) {
    final _messageJsonStr = TWString(messageJson);

    final _r = _tWEthereumMessageSignerImpl.signTypedMessage(privateKey.pointer, _messageJsonStr.pointer);
    _messageJsonStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String signTypedMessageEip155(TWPrivateKey privateKey, String messageJson, int chainId) {
    final _messageJsonStr = TWString(messageJson);

    final _r = _tWEthereumMessageSignerImpl.signTypedMessageEip155(privateKey.pointer, _messageJsonStr.pointer, chainId);
    _messageJsonStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String signMessage(TWPrivateKey privateKey, String message) {
    final _messageStr = TWString(message);

    final _r = _tWEthereumMessageSignerImpl.signMessage(privateKey.pointer, _messageStr.pointer);
    _messageStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String signMessageImmutableX(TWPrivateKey privateKey, String message) {
    final _messageStr = TWString(message);

    final _r = _tWEthereumMessageSignerImpl.signMessageImmutableX(privateKey.pointer, _messageStr.pointer);
    _messageStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String signMessageEip155(TWPrivateKey privateKey, String message, int chainId) {
    final _messageStr = TWString(message);

    final _r = _tWEthereumMessageSignerImpl.signMessageEip155(privateKey.pointer, _messageStr.pointer, chainId);
    _messageStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static bool verifyMessage(TWPublicKey pubKey, String message, String signature) {
    final _messageStr = TWString(message);
final _signatureStr = TWString(signature);

    final _r = _tWEthereumMessageSignerImpl.verifyMessage(pubKey.pointer, _messageStr.pointer, _signatureStr.pointer);
    _messageStr.delete();
    _signatureStr.delete();
    return _r;
  }

}
