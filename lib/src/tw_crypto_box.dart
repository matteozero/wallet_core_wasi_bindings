part of '../wallet_core_wasi_bindings.dart';

TWCryptoBoxInterface get _tWCryptoBoxImpl => WalletCoreWasiBindings.backend<TWCryptoBoxInterface>();

class TWCryptoBox {
  TWCryptoBox._();

  static Uint8List encryptEasy(TWCryptoBoxSecretKey mySecret, TWCryptoBoxPublicKey otherPubkey, Uint8List message) {
    final _messageData = TWData(message);

    final _r = _tWCryptoBoxImpl.encryptEasy(mySecret.pointer, otherPubkey.pointer, _messageData.pointer);
    _messageData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List? decryptEasy(TWCryptoBoxSecretKey mySecret, TWCryptoBoxPublicKey otherPubkey, Uint8List encrypted) {
    final _encryptedData = TWData(encrypted);

    final _r = _tWCryptoBoxImpl.decryptEasy(mySecret.pointer, otherPubkey.pointer, _encryptedData.pointer);
    _encryptedData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
