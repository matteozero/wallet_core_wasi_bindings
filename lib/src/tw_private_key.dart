part of '../wallet_core_wasi_bindings.dart';

TWPrivateKeyInterface get _tWPrivateKeyImpl => WalletCoreWasiBindings.backend<TWPrivateKeyInterface>();

final Finalizer<int> _tWPrivateKeyFinalizer = Finalizer<int>((pointer) {
  _tWPrivateKeyImpl.delete(pointer);
});

class TWPrivateKey extends TWObjectFinalizable {
  factory TWPrivateKey.create() {
    final _ptr = _tWPrivateKeyImpl.create();
    return TWPrivateKey.fromPointer(_ptr);
  }

  factory TWPrivateKey.createWithData(Uint8List data) {
    final _dataData = TWData(data);

    final _ptr = _tWPrivateKeyImpl.createWithData(_dataData.pointer);
    _dataData.delete();
    if (_ptr == 0) throw StateError('TWPrivateKeyCreateWithData failed');
    return TWPrivateKey.fromPointer(_ptr);
  }

  factory TWPrivateKey.createCopy(TWPrivateKey key) {
    final _ptr = _tWPrivateKeyImpl.createCopy(key.pointer);
    if (_ptr == 0) throw StateError('TWPrivateKeyCreateCopy failed');
    return TWPrivateKey.fromPointer(_ptr);
  }

  TWPrivateKey.fromPointer(int pointer) : super(pointer, finalizer: _tWPrivateKeyFinalizer);

  static bool isValid(Uint8List data, TWCurve curve) {
    final _dataData = TWData(data);

    final _r = _tWPrivateKeyImpl.isValid(_dataData.pointer, curve.value);
    _dataData.delete();
    return _r;
  }

  TWPublicKey getPublicKey(TWCoinType coinType) {
    final _r = _tWPrivateKeyImpl.getPublicKey(pointer, coinType.value);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey getPublicKeyByType(TWPublicKeyType pubkeyType) {
    final _r = _tWPrivateKeyImpl.getPublicKeyByType(pointer, pubkeyType.value);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey getPublicKeySecp256k1(bool compressed) {
    final _r = _tWPrivateKeyImpl.getPublicKeySecp256k1(pointer, compressed);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey getPublicKeyNist256p1() {
    final _r = _tWPrivateKeyImpl.getPublicKeyNist256p1(pointer);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey getPublicKeyEd25519() {
    final _r = _tWPrivateKeyImpl.getPublicKeyEd25519(pointer);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey getPublicKeyEd25519Blake2b() {
    final _r = _tWPrivateKeyImpl.getPublicKeyEd25519Blake2b(pointer);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey getPublicKeyEd25519Cardano() {
    final _r = _tWPrivateKeyImpl.getPublicKeyEd25519Cardano(pointer);
    return TWPublicKey.fromPointer(_r);
  }

  TWPublicKey getPublicKeyCurve25519() {
    final _r = _tWPrivateKeyImpl.getPublicKeyCurve25519(pointer);
    return TWPublicKey.fromPointer(_r);
  }

  Uint8List? getSharedKey(TWPublicKey publicKey, TWCurve curve) {
    final _r = _tWPrivateKeyImpl.getSharedKey(pointer, publicKey.pointer, curve.value);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List? sign(Uint8List digest, TWCurve curve) {
    final _digestData = TWData(digest);

    final _r = _tWPrivateKeyImpl.sign(pointer, _digestData.pointer, curve.value);
    _digestData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List? signAsDER(Uint8List digest) {
    final _digestData = TWData(digest);

    final _r = _tWPrivateKeyImpl.signAsDER(pointer, _digestData.pointer);
    _digestData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List? signZilliqaSchnorr(Uint8List message) {
    final _messageData = TWData(message);

    final _r = _tWPrivateKeyImpl.signZilliqaSchnorr(pointer, _messageData.pointer);
    _messageData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List get data {
    final _r = _tWPrivateKeyImpl.data(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWPrivateKeyImpl.delete);
}
