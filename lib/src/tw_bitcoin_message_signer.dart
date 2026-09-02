part of '../wallet_core_wasi_bindings.dart';

TWBitcoinMessageSignerInterface get _tWBitcoinMessageSignerImpl => WalletCoreWasiBindings.backend<TWBitcoinMessageSignerInterface>();

class TWBitcoinMessageSigner {
  TWBitcoinMessageSigner._();

  static String signMessage(TWPrivateKey privateKey, String address, String message) {
    final _addressStr = TWString(address);
final _messageStr = TWString(message);

    final _r = _tWBitcoinMessageSignerImpl.signMessage(privateKey.pointer, _addressStr.pointer, _messageStr.pointer);
    _addressStr.delete();
    _messageStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static bool verifyMessage(String address, String message, String signature) {
    final _addressStr = TWString(address);
final _messageStr = TWString(message);
final _signatureStr = TWString(signature);

    final _r = _tWBitcoinMessageSignerImpl.verifyMessage(_addressStr.pointer, _messageStr.pointer, _signatureStr.pointer);
    _addressStr.delete();
    _messageStr.delete();
    _signatureStr.delete();
    return _r;
  }

}
