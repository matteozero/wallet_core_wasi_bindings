part of '../../wallet_core_wasi_bindings.dart';

class TWEthereumAbiFunctionImpl extends TWEthereumAbiFunctionInterface {
  TWEthereumAbiFunctionImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int name) => wasm.callInt('TWEthereumAbiFunctionCreateWithString', [name]);

  @override
  void delete(int pointer) => wasm.callVoid('TWEthereumAbiFunctionDelete', [pointer]);

  @override
  int getType(int fn) => wasm.callInt('TWEthereumAbiFunctionGetType', [fn]);

  @override
  int addParamUInt8(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamUInt8', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamUInt16(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamUInt16', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamUInt32(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamUInt32', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamUInt64(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamUInt64', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamUInt256(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamUInt256', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamUIntN(int fn, int bits, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamUIntN', [fn, bits, val, (isOutput ? 1 : 0)]);

  @override
  int addParamInt8(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamInt8', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamInt16(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamInt16', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamInt32(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamInt32', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamInt64(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamInt64', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamInt256(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamInt256', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamIntN(int fn, int bits, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamIntN', [fn, bits, val, (isOutput ? 1 : 0)]);

  @override
  int addParamBool(int fn, bool val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamBool', [fn, (val ? 1 : 0), (isOutput ? 1 : 0)]);

  @override
  int addParamString(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamString', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamAddress(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamAddress', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamBytes(int fn, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamBytes', [fn, val, (isOutput ? 1 : 0)]);

  @override
  int addParamBytesFix(int fn, int size, int val, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamBytesFix', [fn, size, val, (isOutput ? 1 : 0)]);

  @override
  int addParamArray(int fn, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionAddParamArray', [fn, (isOutput ? 1 : 0)]);

  @override
  int getParamUInt8(int fn, int idx, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionGetParamUInt8', [fn, idx, (isOutput ? 1 : 0)]);

  @override
  int getParamUInt64(int fn, int idx, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionGetParamUInt64', [fn, idx, (isOutput ? 1 : 0)]);

  @override
  int getParamUInt256(int fn, int idx, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionGetParamUInt256', [fn, idx, (isOutput ? 1 : 0)]);

  @override
  bool getParamBool(int fn, int idx, bool isOutput) => wasm.callBool('TWEthereumAbiFunctionGetParamBool', [fn, idx, (isOutput ? 1 : 0)]);

  @override
  int getParamString(int fn, int idx, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionGetParamString', [fn, idx, (isOutput ? 1 : 0)]);

  @override
  int getParamAddress(int fn, int idx, bool isOutput) => wasm.callInt('TWEthereumAbiFunctionGetParamAddress', [fn, idx, (isOutput ? 1 : 0)]);

  @override
  int addInArrayParamUInt8(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamUInt8', [fn, arrayIdx, val]);

  @override
  int addInArrayParamUInt16(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamUInt16', [fn, arrayIdx, val]);

  @override
  int addInArrayParamUInt32(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamUInt32', [fn, arrayIdx, val]);

  @override
  int addInArrayParamUInt64(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamUInt64', [fn, arrayIdx, val]);

  @override
  int addInArrayParamUInt256(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamUInt256', [fn, arrayIdx, val]);

  @override
  int addInArrayParamUIntN(int fn, int arrayIdx, int bits, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamUIntN', [fn, arrayIdx, bits, val]);

  @override
  int addInArrayParamInt8(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamInt8', [fn, arrayIdx, val]);

  @override
  int addInArrayParamInt16(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamInt16', [fn, arrayIdx, val]);

  @override
  int addInArrayParamInt32(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamInt32', [fn, arrayIdx, val]);

  @override
  int addInArrayParamInt64(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamInt64', [fn, arrayIdx, val]);

  @override
  int addInArrayParamInt256(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamInt256', [fn, arrayIdx, val]);

  @override
  int addInArrayParamIntN(int fn, int arrayIdx, int bits, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamIntN', [fn, arrayIdx, bits, val]);

  @override
  int addInArrayParamBool(int fn, int arrayIdx, bool val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamBool', [fn, arrayIdx, (val ? 1 : 0)]);

  @override
  int addInArrayParamString(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamString', [fn, arrayIdx, val]);

  @override
  int addInArrayParamAddress(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamAddress', [fn, arrayIdx, val]);

  @override
  int addInArrayParamBytes(int fn, int arrayIdx, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamBytes', [fn, arrayIdx, val]);

  @override
  int addInArrayParamBytesFix(int fn, int arrayIdx, int size, int val) => wasm.callInt('TWEthereumAbiFunctionAddInArrayParamBytesFix', [fn, arrayIdx, size, val]);

}
