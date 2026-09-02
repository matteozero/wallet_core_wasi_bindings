part of '../../wallet_core_wasi_bindings.dart';

class TWDataVectorImpl extends TWDataVectorInterface {
  TWDataVectorImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create() => wasm.callInt('TWDataVectorCreate', []);

  @override
  int createWithData(int data) => wasm.callInt('TWDataVectorCreateWithData', [data]);

  @override
  void delete(int pointer) => wasm.callVoid('TWDataVectorDelete', [pointer]);

  @override
  void add(int dataVector, int data) => wasm.callVoid('TWDataVectorAdd', [dataVector, data]);

  @override
  int get_(int dataVector, int index) => wasm.callInt('TWDataVectorGet', [dataVector, index]);

  @override
  int size(int pointer) => wasm.callInt('TWDataVectorSize', [pointer]);

}
