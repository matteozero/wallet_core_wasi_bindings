part of '../../wallet_core_wasi_bindings.dart';

class TWNEARAccountImpl extends TWNEARAccountInterface {
  TWNEARAccountImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWNEARAccountCreateWithString', [string]);

  @override
  void delete(int pointer) => wasm.callVoid('TWNEARAccountDelete', [pointer]);

  @override
  int description(int pointer) => wasm.callInt('TWNEARAccountDescription', [pointer]);

}
