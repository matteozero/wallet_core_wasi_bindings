part of '../wallet_core_wasi_bindings.dart';

TWFIOAccountInterface get _tWFIOAccountImpl => WalletCoreWasiBindings.backend<TWFIOAccountInterface>();

final Finalizer<int> _tWFIOAccountFinalizer = Finalizer<int>((pointer) {
  _tWFIOAccountImpl.delete(pointer);
});

class TWFIOAccount extends TWObjectFinalizable {
  factory TWFIOAccount.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWFIOAccountImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWFIOAccountCreateWithString failed');
    return TWFIOAccount.fromPointer(_ptr);
  }

  TWFIOAccount.fromPointer(int pointer) : super(pointer, finalizer: _tWFIOAccountFinalizer);

  String get description {
    final _r = _tWFIOAccountImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWFIOAccountImpl.delete);
}
