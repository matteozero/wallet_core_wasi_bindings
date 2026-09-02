part of '../wallet_core_wasi_bindings.dart';

TWPublicKeyInterface get _tWPublicKeyImpl => WalletCoreWasiBindings.backend<TWPublicKeyInterface>();

final Finalizer<int> _tWPublicKeyFinalizer = Finalizer<int>((pointer) {
  _tWPublicKeyImpl.delete(pointer);
});

class TWPublicKey extends TWObjectFinalizable {
  factory TWPublicKey.createWithData(Uint8List data, TWPublicKeyType type) {
    final _dataData = TWData(data);

    final _ptr = _tWPublicKeyImpl.createWithData(_dataData.pointer, type.value);
    _dataData.delete();
    if (_ptr == 0) throw StateError('TWPublicKeyCreateWithData failed');
    return TWPublicKey.fromPointer(_ptr);
  }

  TWPublicKey.fromPointer(int pointer) : super(pointer, finalizer: _tWPublicKeyFinalizer);

  static bool isValid(Uint8List data, TWPublicKeyType type) {
    final _dataData = TWData(data);

    final _r = _tWPublicKeyImpl.isValid(_dataData.pointer, type.value);
    _dataData.delete();
    return _r;
  }

  bool verify(Uint8List signature, Uint8List message) {
    final _signatureData = TWData(signature);
final _messageData = TWData(message);

    final _r = _tWPublicKeyImpl.verify(pointer, _signatureData.pointer, _messageData.pointer);
    _signatureData.delete();
    _messageData.delete();
    return _r;
  }

  bool verifyAsDER(Uint8List signature, Uint8List message) {
    final _signatureData = TWData(signature);
final _messageData = TWData(message);

    final _r = _tWPublicKeyImpl.verifyAsDER(pointer, _signatureData.pointer, _messageData.pointer);
    _signatureData.delete();
    _messageData.delete();
    return _r;
  }

  bool verifyZilliqaSchnorr(Uint8List signature, Uint8List message) {
    final _signatureData = TWData(signature);
final _messageData = TWData(message);

    final _r = _tWPublicKeyImpl.verifyZilliqaSchnorr(pointer, _signatureData.pointer, _messageData.pointer);
    _signatureData.delete();
    _messageData.delete();
    return _r;
  }

  static TWPublicKey? recover(Uint8List signature, Uint8List message) {
    final _signatureData = TWData(signature);
final _messageData = TWData(message);

    final _r = _tWPublicKeyImpl.recover(_signatureData.pointer, _messageData.pointer);
    _signatureData.delete();
    _messageData.delete();
    return ((_r) == 0 ? null : TWPublicKey.fromPointer(_r));
  }

  bool get isCompressed {
    final _r = _tWPublicKeyImpl.isCompressed(pointer);
    return _r;
  }

  TWPublicKey get compressed {
    final _r = _tWPublicKeyImpl.compressed(pointer);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey get uncompressed {
    final _r = _tWPublicKeyImpl.uncompressed(pointer);
    return TWPublicKey.fromPointer(_r);
  }

  Uint8List get data {
    final _r = _tWPublicKeyImpl.data(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  TWPublicKeyType get keyType {
    final _r = _tWPublicKeyImpl.keyType(pointer);
    return TWPublicKeyType.fromValue(_r);
  }

  String get description {
    final _r = _tWPublicKeyImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWPublicKeyImpl.delete);
}
