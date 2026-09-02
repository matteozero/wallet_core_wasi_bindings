part of '../wallet_core_wasi_bindings.dart';

TWDataVectorInterface get _tWDataVectorImpl => WalletCoreWasiBindings.backend<TWDataVectorInterface>();

final Finalizer<int> _tWDataVectorFinalizer = Finalizer<int>((pointer) {
  _tWDataVectorImpl.delete(pointer);
});

class TWDataVector extends TWObjectFinalizable {
  factory TWDataVector.create() {
    final _ptr = _tWDataVectorImpl.create();
    return TWDataVector.fromPointer(_ptr);
  }

  factory TWDataVector.createWithData(Uint8List data) {
    final _dataData = TWData(data);

    final _ptr = _tWDataVectorImpl.createWithData(_dataData.pointer);
    _dataData.delete();
    return TWDataVector.fromPointer(_ptr);
  }

  TWDataVector.fromPointer(int pointer) : super(pointer, finalizer: _tWDataVectorFinalizer);

  void add(Uint8List data) {
    final _dataData = TWData(data);

    _tWDataVectorImpl.add(pointer, _dataData.pointer);
    _dataData.delete();
  }

  Uint8List? get_(int index) {
    final _r = _tWDataVectorImpl.get_(pointer, index);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  int get size {
    final _r = _tWDataVectorImpl.size(pointer);
    return _r;
  }

  void delete() => disposeWith(_tWDataVectorImpl.delete);
}
