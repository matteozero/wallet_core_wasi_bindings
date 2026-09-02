part of '../../wallet_core_wasi_bindings.dart';

class TWFIOAccountImpl extends TWFIOAccountInterface {
  TWFIOAccountImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWFIOAccountCreateWithString', [string]);

  @override
  void delete(int pointer) => wasm.callVoid('TWFIOAccountDelete', [pointer]);

  @override
  int description(int pointer) => wasm.callInt('TWFIOAccountDescription', [pointer]);

}
