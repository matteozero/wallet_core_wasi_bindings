part of '../wallet_core_wasi_bindings.dart';

TWEthereumAbiFunctionInterface get _tWEthereumAbiFunctionImpl => WalletCoreWasiBindings.backend<TWEthereumAbiFunctionInterface>();

final Finalizer<int> _tWEthereumAbiFunctionFinalizer = Finalizer<int>((pointer) {
  _tWEthereumAbiFunctionImpl.delete(pointer);
});

class TWEthereumAbiFunction extends TWObjectFinalizable {
  factory TWEthereumAbiFunction.createWithString(String name) {
    final _nameStr = TWString(name);

    final _ptr = _tWEthereumAbiFunctionImpl.createWithString(_nameStr.pointer);
    _nameStr.delete();
    return TWEthereumAbiFunction.fromPointer(_ptr);
  }

  TWEthereumAbiFunction.fromPointer(int pointer) : super(pointer, finalizer: _tWEthereumAbiFunctionFinalizer);

  String getType() {
    final _r = _tWEthereumAbiFunctionImpl.getType(pointer);
    return TWString.fromPointer(_r).value;
  }

  int addParamUInt8(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamUInt8(pointer, val, isOutput);
    return _r;
  }

  int addParamUInt16(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamUInt16(pointer, val, isOutput);
    return _r;
  }

  int addParamUInt32(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamUInt32(pointer, val, isOutput);
    return _r;
  }

  int addParamUInt64(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamUInt64(pointer, val, isOutput);
    return _r;
  }

  int addParamUInt256(Uint8List val, bool isOutput) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamUInt256(pointer, _valData.pointer, isOutput);
    _valData.delete();
    return _r;
  }

  int addParamUIntN(int bits, Uint8List val, bool isOutput) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamUIntN(pointer, bits, _valData.pointer, isOutput);
    _valData.delete();
    return _r;
  }

  int addParamInt8(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamInt8(pointer, val, isOutput);
    return _r;
  }

  int addParamInt16(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamInt16(pointer, val, isOutput);
    return _r;
  }

  int addParamInt32(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamInt32(pointer, val, isOutput);
    return _r;
  }

  int addParamInt64(int val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamInt64(pointer, val, isOutput);
    return _r;
  }

  int addParamInt256(Uint8List val, bool isOutput) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamInt256(pointer, _valData.pointer, isOutput);
    _valData.delete();
    return _r;
  }

  int addParamIntN(int bits, Uint8List val, bool isOutput) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamIntN(pointer, bits, _valData.pointer, isOutput);
    _valData.delete();
    return _r;
  }

  int addParamBool(bool val, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamBool(pointer, val, isOutput);
    return _r;
  }

  int addParamString(String val, bool isOutput) {
    final _valStr = TWString(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamString(pointer, _valStr.pointer, isOutput);
    _valStr.delete();
    return _r;
  }

  int addParamAddress(Uint8List val, bool isOutput) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamAddress(pointer, _valData.pointer, isOutput);
    _valData.delete();
    return _r;
  }

  int addParamBytes(Uint8List val, bool isOutput) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamBytes(pointer, _valData.pointer, isOutput);
    _valData.delete();
    return _r;
  }

  int addParamBytesFix(int size, Uint8List val, bool isOutput) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addParamBytesFix(pointer, size, _valData.pointer, isOutput);
    _valData.delete();
    return _r;
  }

  int addParamArray(bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.addParamArray(pointer, isOutput);
    return _r;
  }

  int getParamUInt8(int idx, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.getParamUInt8(pointer, idx, isOutput);
    return _r;
  }

  int getParamUInt64(int idx, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.getParamUInt64(pointer, idx, isOutput);
    return _r;
  }

  Uint8List getParamUInt256(int idx, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.getParamUInt256(pointer, idx, isOutput);
    return TWData.fromPointer(_r).bytes;
  }

  bool getParamBool(int idx, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.getParamBool(pointer, idx, isOutput);
    return _r;
  }

  String getParamString(int idx, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.getParamString(pointer, idx, isOutput);
    return TWString.fromPointer(_r).value;
  }

  Uint8List getParamAddress(int idx, bool isOutput) {
    final _r = _tWEthereumAbiFunctionImpl.getParamAddress(pointer, idx, isOutput);
    return TWData.fromPointer(_r).bytes;
  }

  int addInArrayParamUInt8(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamUInt8(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamUInt16(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamUInt16(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamUInt32(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamUInt32(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamUInt64(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamUInt64(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamUInt256(int arrayIdx, Uint8List val) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamUInt256(pointer, arrayIdx, _valData.pointer);
    _valData.delete();
    return _r;
  }

  int addInArrayParamUIntN(int arrayIdx, int bits, Uint8List val) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamUIntN(pointer, arrayIdx, bits, _valData.pointer);
    _valData.delete();
    return _r;
  }

  int addInArrayParamInt8(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamInt8(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamInt16(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamInt16(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamInt32(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamInt32(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamInt64(int arrayIdx, int val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamInt64(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamInt256(int arrayIdx, Uint8List val) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamInt256(pointer, arrayIdx, _valData.pointer);
    _valData.delete();
    return _r;
  }

  int addInArrayParamIntN(int arrayIdx, int bits, Uint8List val) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamIntN(pointer, arrayIdx, bits, _valData.pointer);
    _valData.delete();
    return _r;
  }

  int addInArrayParamBool(int arrayIdx, bool val) {
    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamBool(pointer, arrayIdx, val);
    return _r;
  }

  int addInArrayParamString(int arrayIdx, String val) {
    final _valStr = TWString(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamString(pointer, arrayIdx, _valStr.pointer);
    _valStr.delete();
    return _r;
  }

  int addInArrayParamAddress(int arrayIdx, Uint8List val) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamAddress(pointer, arrayIdx, _valData.pointer);
    _valData.delete();
    return _r;
  }

  int addInArrayParamBytes(int arrayIdx, Uint8List val) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamBytes(pointer, arrayIdx, _valData.pointer);
    _valData.delete();
    return _r;
  }

  int addInArrayParamBytesFix(int arrayIdx, int size, Uint8List val) {
    final _valData = TWData(val);

    final _r = _tWEthereumAbiFunctionImpl.addInArrayParamBytesFix(pointer, arrayIdx, size, _valData.pointer);
    _valData.delete();
    return _r;
  }

  void delete() => disposeWith(_tWEthereumAbiFunctionImpl.delete);
}
