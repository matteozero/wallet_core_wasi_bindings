part of '../../wallet_core_wasi_bindings.dart';

class TWDataImpl extends TWDataInterface {
  TWDataImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithBytes(Uint8List bytes) {
    final scratch = wasm.mallocBytes(bytes);
    final ptr = wasm.callInt('TWDataCreateWithBytes', [scratch, bytes.length]);
    wasm.free(scratch);
    return ptr;
  }

  @override
  int createWithSize(int size) => wasm.callInt('TWDataCreateWithSize', [size]);

  @override
  int createWithData(int dataPointer) => wasm.callInt('TWDataCreateWithData', [dataPointer]);

  @override
  int createWithHexString(String hex) {
    final hexStr = TWString(hex);
    final ptr = wasm.callInt('TWDataCreateWithHexString', [hexStr.pointer]);
    hexStr.delete();
    return ptr;
  }

  @override
  int size(int pointer) => wasm.callInt('TWDataSize', [pointer]);

  @override
  Uint8List bytes(int pointer) {
    final len = size(pointer);
    final bytesPtr = wasm.callInt('TWDataBytes', [pointer]);
    return wasm.readBytes(bytesPtr, len);
  }

  @override
  void setByte(int pointer, int index, int byte) =>
      wasm.callVoid('TWDataSet', [pointer, index, byte]);

  @override
  bool copyBytes(int pointer, int start, int size, Uint8List output) {
    final scratch = wasm.malloc(size);
    final ok = wasm.callInt('TWDataCopyBytes', [pointer, start, size, scratch]) == 0;
    output.setRange(0, size, wasm.readBytes(scratch, size));
    wasm.free(scratch);
    return ok;
  }

  @override
  bool replaceBytes(int pointer, int start, int size, Uint8List bytes) {
    final scratch = wasm.mallocBytes(bytes);
    final ok = wasm.callInt('TWDataReplaceBytes', [pointer, start, size, scratch]) == 0;
    wasm.free(scratch);
    return ok;
  }

  @override
  void appendBytes(int pointer, Uint8List bytes) {
    final scratch = wasm.mallocBytes(bytes);
    wasm.callVoid('TWDataAppendBytes', [pointer, scratch, bytes.length]);
    wasm.free(scratch);
  }

  @override
  void appendByte(int pointer, int byte) => wasm.callVoid('TWDataAppendByte', [pointer, byte]);

  @override
  void appendData(int pointer, int otherPointer) =>
      wasm.callVoid('TWDataAppendData', [pointer, otherPointer]);

  @override
  void reverse(int pointer) => wasm.callVoid('TWDataReverse', [pointer]);

  @override
  void reset(int pointer) => wasm.callVoid('TWDataReset', [pointer]);

  @override
  bool equal(int lhsPointer, int rhsPointer) => wasm.callBool('TWDataEqual', [lhsPointer, rhsPointer]);

  @override
  void delete(int pointer) => wasm.callVoid('TWDataDelete', [pointer]);
}
