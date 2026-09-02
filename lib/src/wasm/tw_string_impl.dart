part of '../../wallet_core_wasi_bindings.dart';

class TWStringImpl extends TWStringInterface {
  TWStringImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create(String value) {
    final scratch = wasm.mallocCString(value);
    final ptr = wasm.callInt('TWStringCreateWithUTF8Bytes', [scratch]);
    wasm.free(scratch);
    return ptr;
  }

  @override
  int createWithRawBytes(Uint8List bytes) {
    final scratch = wasm.mallocBytes(bytes);
    final ptr = wasm.callInt('TWStringCreateWithRawBytes', [scratch, bytes.length]);
    wasm.free(scratch);
    return ptr;
  }

  @override
  int createWithHexData(int dataPointer) =>
      wasm.callInt('TWStringCreateWithHexData', [dataPointer]);

  @override
  int size(int pointer) => wasm.callInt('TWStringSize', [pointer]);

  @override
  int byteAt(int pointer, int index) => wasm.callInt('TWStringGet', [pointer, index]);

  @override
  String utf8Bytes(int pointer) {
    final len = size(pointer);
    final bytesPtr = wasm.callInt('TWStringUTF8Bytes', [pointer]);
    return utf8.decode(wasm.readBytes(bytesPtr, len));
  }

  @override
  bool equal(int lhsPointer, int rhsPointer) =>
      wasm.callBool('TWStringEqual', [lhsPointer, rhsPointer]);

  @override
  void delete(int pointer) => wasm.callVoid('TWStringDelete', [pointer]);
}
