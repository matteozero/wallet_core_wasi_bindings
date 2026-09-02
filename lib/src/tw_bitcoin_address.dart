part of '../wallet_core_wasi_bindings.dart';

TWBitcoinAddressInterface get _tWBitcoinAddressImpl => WalletCoreWasiBindings.backend<TWBitcoinAddressInterface>();

final Finalizer<int> _tWBitcoinAddressFinalizer = Finalizer<int>((pointer) {
  _tWBitcoinAddressImpl.delete(pointer);
});

class TWBitcoinAddress extends TWObjectFinalizable {
  factory TWBitcoinAddress.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWBitcoinAddressImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWBitcoinAddressCreateWithString failed');
    return TWBitcoinAddress.fromPointer(_ptr);
  }

  factory TWBitcoinAddress.createWithData(Uint8List data) {
    final _dataData = TWData(data);

    final _ptr = _tWBitcoinAddressImpl.createWithData(_dataData.pointer);
    _dataData.delete();
    if (_ptr == 0) throw StateError('TWBitcoinAddressCreateWithData failed');
    return TWBitcoinAddress.fromPointer(_ptr);
  }

  factory TWBitcoinAddress.createWithPublicKey(TWPublicKey publicKey, int prefix) {
    final _ptr = _tWBitcoinAddressImpl.createWithPublicKey(publicKey.pointer, prefix);
    if (_ptr == 0) throw StateError('TWBitcoinAddressCreateWithPublicKey failed');
    return TWBitcoinAddress.fromPointer(_ptr);
  }

  TWBitcoinAddress.fromPointer(int pointer) : super(pointer, finalizer: _tWBitcoinAddressFinalizer);

  static bool equal(TWBitcoinAddress lhs, TWBitcoinAddress rhs) {
    final _r = _tWBitcoinAddressImpl.equal(lhs.pointer, rhs.pointer);
    return _r;
  }

  static bool isValid(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWBitcoinAddressImpl.isValid(_dataData.pointer);
    _dataData.delete();
    return _r;
  }

  static bool isValidString(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBitcoinAddressImpl.isValidString(_stringStr.pointer);
    _stringStr.delete();
    return _r;
  }

  String get description {
    final _r = _tWBitcoinAddressImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  int get prefix {
    final _r = _tWBitcoinAddressImpl.prefix(pointer);
    return _r;
  }

  Uint8List get keyhash {
    final _r = _tWBitcoinAddressImpl.keyhash(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWBitcoinAddressImpl.delete);
}
