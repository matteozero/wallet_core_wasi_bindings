part of '../wallet_core_wasi_bindings.dart';

TWGroestlcoinAddressInterface get _tWGroestlcoinAddressImpl => WalletCoreWasiBindings.backend<TWGroestlcoinAddressInterface>();

final Finalizer<int> _tWGroestlcoinAddressFinalizer = Finalizer<int>((pointer) {
  _tWGroestlcoinAddressImpl.delete(pointer);
});

class TWGroestlcoinAddress extends TWObjectFinalizable {
  factory TWGroestlcoinAddress.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWGroestlcoinAddressImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWGroestlcoinAddressCreateWithString failed');
    return TWGroestlcoinAddress.fromPointer(_ptr);
  }

  factory TWGroestlcoinAddress.createWithPublicKey(TWPublicKey publicKey, int prefix) {
    final _ptr = _tWGroestlcoinAddressImpl.createWithPublicKey(publicKey.pointer, prefix);
    return TWGroestlcoinAddress.fromPointer(_ptr);
  }

  TWGroestlcoinAddress.fromPointer(int pointer) : super(pointer, finalizer: _tWGroestlcoinAddressFinalizer);

  static bool equal(TWGroestlcoinAddress lhs, TWGroestlcoinAddress rhs) {
    final _r = _tWGroestlcoinAddressImpl.equal(lhs.pointer, rhs.pointer);
    return _r;
  }

  static bool isValidString(String string) {
    final _stringStr = TWString(string);

    final _r = _tWGroestlcoinAddressImpl.isValidString(_stringStr.pointer);
    _stringStr.delete();
    return _r;
  }

  String get description {
    final _r = _tWGroestlcoinAddressImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWGroestlcoinAddressImpl.delete);
}
