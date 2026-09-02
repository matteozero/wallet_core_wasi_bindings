part of '../wallet_core_wasi_bindings.dart';

TWCryptoBoxSecretKeyInterface get _tWCryptoBoxSecretKeyImpl => WalletCoreWasiBindings.backend<TWCryptoBoxSecretKeyInterface>();

final Finalizer<int> _tWCryptoBoxSecretKeyFinalizer = Finalizer<int>((pointer) {
  _tWCryptoBoxSecretKeyImpl.delete(pointer);
});

class TWCryptoBoxSecretKey extends TWObjectFinalizable {
  factory TWCryptoBoxSecretKey.create() {
    final _ptr = _tWCryptoBoxSecretKeyImpl.create();
    return TWCryptoBoxSecretKey.fromPointer(_ptr);
  }

  factory TWCryptoBoxSecretKey.createWithData(Uint8List data) {
    final _dataData = TWData(data);

    final _ptr = _tWCryptoBoxSecretKeyImpl.createWithData(_dataData.pointer);
    _dataData.delete();
    if (_ptr == 0) throw StateError('TWCryptoBoxSecretKeyCreateWithData failed');
    return TWCryptoBoxSecretKey.fromPointer(_ptr);
  }

  TWCryptoBoxSecretKey.fromPointer(int pointer) : super(pointer, finalizer: _tWCryptoBoxSecretKeyFinalizer);

  static bool isValid(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWCryptoBoxSecretKeyImpl.isValid(_dataData.pointer);
    _dataData.delete();
    return _r;
  }

  TWCryptoBoxPublicKey getPublicKey() {
    final _r = _tWCryptoBoxSecretKeyImpl.getPublicKey(pointer);
    return TWCryptoBoxPublicKey.fromPointer(_r);
  }

  Uint8List data(TWCryptoBoxSecretKey secretKey) {
    final _r = _tWCryptoBoxSecretKeyImpl.data(pointer, secretKey.pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWCryptoBoxSecretKeyImpl.delete);
}
