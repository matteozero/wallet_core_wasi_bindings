part of '../wallet_core_wasi_bindings.dart';

TWSegwitAddressInterface get _tWSegwitAddressImpl => WalletCoreWasiBindings.backend<TWSegwitAddressInterface>();

final Finalizer<int> _tWSegwitAddressFinalizer = Finalizer<int>((pointer) {
  _tWSegwitAddressImpl.delete(pointer);
});

class TWSegwitAddress extends TWObjectFinalizable {
  factory TWSegwitAddress.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWSegwitAddressImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWSegwitAddressCreateWithString failed');
    return TWSegwitAddress.fromPointer(_ptr);
  }

  factory TWSegwitAddress.createWithPublicKey(TWHRP hrp, TWPublicKey publicKey) {
    final _ptr = _tWSegwitAddressImpl.createWithPublicKey(hrp.value, publicKey.pointer);
    return TWSegwitAddress.fromPointer(_ptr);
  }

  TWSegwitAddress.fromPointer(int pointer) : super(pointer, finalizer: _tWSegwitAddressFinalizer);

  static bool equal(TWSegwitAddress lhs, TWSegwitAddress rhs) {
    final _r = _tWSegwitAddressImpl.equal(lhs.pointer, rhs.pointer);
    return _r;
  }

  static bool isValidString(String string) {
    final _stringStr = TWString(string);

    final _r = _tWSegwitAddressImpl.isValidString(_stringStr.pointer);
    _stringStr.delete();
    return _r;
  }

  String get description {
    final _r = _tWSegwitAddressImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  TWHRP get hRP {
    final _r = _tWSegwitAddressImpl.hRP(pointer);
    return TWHRP.fromValue(_r);
  }

  int get witnessVersion {
    final _r = _tWSegwitAddressImpl.witnessVersion(pointer);
    return _r;
  }

  Uint8List get witnessProgram {
    final _r = _tWSegwitAddressImpl.witnessProgram(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWSegwitAddressImpl.delete);
}
