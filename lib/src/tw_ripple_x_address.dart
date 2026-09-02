part of '../wallet_core_wasi_bindings.dart';

TWRippleXAddressInterface get _tWRippleXAddressImpl => WalletCoreWasiBindings.backend<TWRippleXAddressInterface>();

final Finalizer<int> _tWRippleXAddressFinalizer = Finalizer<int>((pointer) {
  _tWRippleXAddressImpl.delete(pointer);
});

class TWRippleXAddress extends TWObjectFinalizable {
  factory TWRippleXAddress.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWRippleXAddressImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWRippleXAddressCreateWithString failed');
    return TWRippleXAddress.fromPointer(_ptr);
  }

  factory TWRippleXAddress.createWithPublicKey(TWPublicKey publicKey, int tag) {
    final _ptr = _tWRippleXAddressImpl.createWithPublicKey(publicKey.pointer, tag);
    return TWRippleXAddress.fromPointer(_ptr);
  }

  TWRippleXAddress.fromPointer(int pointer) : super(pointer, finalizer: _tWRippleXAddressFinalizer);

  static bool equal(TWRippleXAddress lhs, TWRippleXAddress rhs) {
    final _r = _tWRippleXAddressImpl.equal(lhs.pointer, rhs.pointer);
    return _r;
  }

  static bool isValidString(String string) {
    final _stringStr = TWString(string);

    final _r = _tWRippleXAddressImpl.isValidString(_stringStr.pointer);
    _stringStr.delete();
    return _r;
  }

  String get description {
    final _r = _tWRippleXAddressImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  int get tag {
    final _r = _tWRippleXAddressImpl.tag(pointer);
    return _r;
  }

  void delete() => disposeWith(_tWRippleXAddressImpl.delete);
}
