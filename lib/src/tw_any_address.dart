part of '../wallet_core_wasi_bindings.dart';

TWAnyAddressInterface get _tWAnyAddressImpl => WalletCoreWasiBindings.backend<TWAnyAddressInterface>();

final Finalizer<int> _tWAnyAddressFinalizer = Finalizer<int>((pointer) {
  _tWAnyAddressImpl.delete(pointer);
});

class TWAnyAddress extends TWObjectFinalizable {
  factory TWAnyAddress.createWithString(String string, TWCoinType coin) {
    final _stringStr = TWString(string);

    final _ptr = _tWAnyAddressImpl.createWithString(_stringStr.pointer, coin.value);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWAnyAddressCreateWithString failed');
    return TWAnyAddress.fromPointer(_ptr);
  }

  factory TWAnyAddress.createBech32(String string, TWCoinType coin, String hrp) {
    final _stringStr = TWString(string);
final _hrpStr = TWString(hrp);

    final _ptr = _tWAnyAddressImpl.createBech32(_stringStr.pointer, coin.value, _hrpStr.pointer);
    _stringStr.delete();
    _hrpStr.delete();
    if (_ptr == 0) throw StateError('TWAnyAddressCreateBech32 failed');
    return TWAnyAddress.fromPointer(_ptr);
  }

  factory TWAnyAddress.createSS58(String string, TWCoinType coin, int ss58Prefix) {
    final _stringStr = TWString(string);

    final _ptr = _tWAnyAddressImpl.createSS58(_stringStr.pointer, coin.value, ss58Prefix);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWAnyAddressCreateSS58 failed');
    return TWAnyAddress.fromPointer(_ptr);
  }

  factory TWAnyAddress.createWithPublicKey(TWPublicKey publicKey, TWCoinType coin) {
    final _ptr = _tWAnyAddressImpl.createWithPublicKey(publicKey.pointer, coin.value);
    return TWAnyAddress.fromPointer(_ptr);
  }

  factory TWAnyAddress.createWithPublicKeyDerivation(TWPublicKey publicKey, TWCoinType coin, TWDerivation derivation) {
    final _ptr = _tWAnyAddressImpl.createWithPublicKeyDerivation(publicKey.pointer, coin.value, derivation.value);
    return TWAnyAddress.fromPointer(_ptr);
  }

  factory TWAnyAddress.createBech32WithPublicKey(TWPublicKey publicKey, TWCoinType coin, String hrp) {
    final _hrpStr = TWString(hrp);

    final _ptr = _tWAnyAddressImpl.createBech32WithPublicKey(publicKey.pointer, coin.value, _hrpStr.pointer);
    _hrpStr.delete();
    return TWAnyAddress.fromPointer(_ptr);
  }

  factory TWAnyAddress.createSS58WithPublicKey(TWPublicKey publicKey, TWCoinType coin, int ss58Prefix) {
    final _ptr = _tWAnyAddressImpl.createSS58WithPublicKey(publicKey.pointer, coin.value, ss58Prefix);
    return TWAnyAddress.fromPointer(_ptr);
  }

  factory TWAnyAddress.createWithPublicKeyFilecoinAddressType(TWPublicKey publicKey, TWFilecoinAddressType filecoinAddressType) {
    final _ptr = _tWAnyAddressImpl.createWithPublicKeyFilecoinAddressType(publicKey.pointer, filecoinAddressType.value);
    return TWAnyAddress.fromPointer(_ptr);
  }

  TWAnyAddress.fromPointer(int pointer) : super(pointer, finalizer: _tWAnyAddressFinalizer);

  static bool equal(TWAnyAddress lhs, TWAnyAddress rhs) {
    final _r = _tWAnyAddressImpl.equal(lhs.pointer, rhs.pointer);
    return _r;
  }

  static bool isValid(String string, TWCoinType coin) {
    final _stringStr = TWString(string);

    final _r = _tWAnyAddressImpl.isValid(_stringStr.pointer, coin.value);
    _stringStr.delete();
    return _r;
  }

  static bool isValidBech32(String string, TWCoinType coin, String hrp) {
    final _stringStr = TWString(string);
final _hrpStr = TWString(hrp);

    final _r = _tWAnyAddressImpl.isValidBech32(_stringStr.pointer, coin.value, _hrpStr.pointer);
    _stringStr.delete();
    _hrpStr.delete();
    return _r;
  }

  static bool isValidSS58(String string, TWCoinType coin, int ss58Prefix) {
    final _stringStr = TWString(string);

    final _r = _tWAnyAddressImpl.isValidSS58(_stringStr.pointer, coin.value, ss58Prefix);
    _stringStr.delete();
    return _r;
  }

  static TWAnyAddress createWithPublicKeyFiroAddressType(TWPublicKey publicKey, TWFiroAddressType firoAddressType) {
    final _r = _tWAnyAddressImpl.createWithPublicKeyFiroAddressType(publicKey.pointer, firoAddressType.value);
    return TWAnyAddress.fromPointer(_r);
  }

  String get description {
    final _r = _tWAnyAddressImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  TWCoinType get coin {
    final _r = _tWAnyAddressImpl.coin(pointer);
    return TWCoinType.fromValue(_r);
  }

  Uint8List get data {
    final _r = _tWAnyAddressImpl.data(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWAnyAddressImpl.delete);
}
