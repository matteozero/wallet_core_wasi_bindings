part of '../wallet_core_wasi_bindings.dart';

TWNervosAddressInterface get _tWNervosAddressImpl => WalletCoreWasiBindings.backend<TWNervosAddressInterface>();

final Finalizer<int> _tWNervosAddressFinalizer = Finalizer<int>((pointer) {
  _tWNervosAddressImpl.delete(pointer);
});

class TWNervosAddress extends TWObjectFinalizable {
  factory TWNervosAddress.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWNervosAddressImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWNervosAddressCreateWithString failed');
    return TWNervosAddress.fromPointer(_ptr);
  }

  TWNervosAddress.fromPointer(int pointer) : super(pointer, finalizer: _tWNervosAddressFinalizer);

  static bool equal(TWNervosAddress lhs, TWNervosAddress rhs) {
    final _r = _tWNervosAddressImpl.equal(lhs.pointer, rhs.pointer);
    return _r;
  }

  static bool isValidString(String string) {
    final _stringStr = TWString(string);

    final _r = _tWNervosAddressImpl.isValidString(_stringStr.pointer);
    _stringStr.delete();
    return _r;
  }

  String get description {
    final _r = _tWNervosAddressImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  Uint8List get codeHash {
    final _r = _tWNervosAddressImpl.codeHash(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  String get hashType {
    final _r = _tWNervosAddressImpl.hashType(pointer);
    return TWString.fromPointer(_r).value;
  }

  Uint8List get args {
    final _r = _tWNervosAddressImpl.args(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWNervosAddressImpl.delete);
}
