part of '../wallet_core_wasi_bindings.dart';

TWNEARAccountInterface get _tWNEARAccountImpl => WalletCoreWasiBindings.backend<TWNEARAccountInterface>();

final Finalizer<int> _tWNEARAccountFinalizer = Finalizer<int>((pointer) {
  _tWNEARAccountImpl.delete(pointer);
});

class TWNEARAccount extends TWObjectFinalizable {
  factory TWNEARAccount.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWNEARAccountImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWNEARAccountCreateWithString failed');
    return TWNEARAccount.fromPointer(_ptr);
  }

  TWNEARAccount.fromPointer(int pointer) : super(pointer, finalizer: _tWNEARAccountFinalizer);

  String get description {
    final _r = _tWNEARAccountImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWNEARAccountImpl.delete);
}
