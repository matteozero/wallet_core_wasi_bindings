part of '../wallet_core_wasi_bindings.dart';

TWDerivationPathInterface get _tWDerivationPathImpl => WalletCoreWasiBindings.backend<TWDerivationPathInterface>();

final Finalizer<int> _tWDerivationPathFinalizer = Finalizer<int>((pointer) {
  _tWDerivationPathImpl.delete(pointer);
});

class TWDerivationPath extends TWObjectFinalizable {
  factory TWDerivationPath.create(TWPurpose purpose, int coin, int account, int change, int address) {
    final _ptr = _tWDerivationPathImpl.create(purpose.value, coin, account, change, address);
    return TWDerivationPath.fromPointer(_ptr);
  }

  factory TWDerivationPath.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWDerivationPathImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWDerivationPathCreateWithString failed');
    return TWDerivationPath.fromPointer(_ptr);
  }

  TWDerivationPath.fromPointer(int pointer) : super(pointer, finalizer: _tWDerivationPathFinalizer);

  TWDerivationPathIndex? indexAt(int index) {
    final _r = _tWDerivationPathImpl.indexAt(pointer, index);
    return ((_r) == 0 ? null : TWDerivationPathIndex.fromPointer(_r));
  }

  int indicesCount() {
    final _r = _tWDerivationPathImpl.indicesCount(pointer);
    return _r;
  }

  TWPurpose get purpose {
    final _r = _tWDerivationPathImpl.purpose(pointer);
    return TWPurpose.fromValue(_r);
  }

  int get coin {
    final _r = _tWDerivationPathImpl.coin(pointer);
    return _r;
  }

  int get account {
    final _r = _tWDerivationPathImpl.account(pointer);
    return _r;
  }

  int get change {
    final _r = _tWDerivationPathImpl.change(pointer);
    return _r;
  }

  int get address {
    final _r = _tWDerivationPathImpl.address(pointer);
    return _r;
  }

  String get description {
    final _r = _tWDerivationPathImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWDerivationPathImpl.delete);
}
