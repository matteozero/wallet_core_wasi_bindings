part of '../wallet_core_wasi_bindings.dart';

TWDerivationPathIndexInterface get _tWDerivationPathIndexImpl => WalletCoreWasiBindings.backend<TWDerivationPathIndexInterface>();

final Finalizer<int> _tWDerivationPathIndexFinalizer = Finalizer<int>((pointer) {
  _tWDerivationPathIndexImpl.delete(pointer);
});

class TWDerivationPathIndex extends TWObjectFinalizable {
  factory TWDerivationPathIndex.create(int value, bool hardened) {
    final _ptr = _tWDerivationPathIndexImpl.create(value, hardened);
    return TWDerivationPathIndex.fromPointer(_ptr);
  }

  TWDerivationPathIndex.fromPointer(int pointer) : super(pointer, finalizer: _tWDerivationPathIndexFinalizer);

  int get value {
    final _r = _tWDerivationPathIndexImpl.value(pointer);
    return _r;
  }

  bool get hardened {
    final _r = _tWDerivationPathIndexImpl.hardened(pointer);
    return _r;
  }

  String get description {
    final _r = _tWDerivationPathIndexImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWDerivationPathIndexImpl.delete);
}
