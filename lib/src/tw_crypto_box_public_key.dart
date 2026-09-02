part of '../wallet_core_wasi_bindings.dart';

TWCryptoBoxPublicKeyInterface get _tWCryptoBoxPublicKeyImpl => WalletCoreWasiBindings.backend<TWCryptoBoxPublicKeyInterface>();

final Finalizer<int> _tWCryptoBoxPublicKeyFinalizer = Finalizer<int>((pointer) {
  _tWCryptoBoxPublicKeyImpl.delete(pointer);
});

class TWCryptoBoxPublicKey extends TWObjectFinalizable {
  factory TWCryptoBoxPublicKey.createWithData(Uint8List data) {
    final _dataData = TWData(data);

    final _ptr = _tWCryptoBoxPublicKeyImpl.createWithData(_dataData.pointer);
    _dataData.delete();
    if (_ptr == 0) throw StateError('TWCryptoBoxPublicKeyCreateWithData failed');
    return TWCryptoBoxPublicKey.fromPointer(_ptr);
  }

  TWCryptoBoxPublicKey.fromPointer(int pointer) : super(pointer, finalizer: _tWCryptoBoxPublicKeyFinalizer);

  static bool isValid(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWCryptoBoxPublicKeyImpl.isValid(_dataData.pointer);
    _dataData.delete();
    return _r;
  }

  Uint8List data(TWCryptoBoxPublicKey publicKey) {
    final _r = _tWCryptoBoxPublicKeyImpl.data(pointer, publicKey.pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWCryptoBoxPublicKeyImpl.delete);
}
