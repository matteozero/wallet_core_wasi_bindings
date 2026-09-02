part of '../../wallet_core_wasi_bindings.dart';

class TWDerivationPathIndexImpl extends TWDerivationPathIndexInterface {
  TWDerivationPathIndexImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create(int value, bool hardened) => wasm.callInt('TWDerivationPathIndexCreate', [value, (hardened ? 1 : 0)]);

  @override
  void delete(int pointer) => wasm.callVoid('TWDerivationPathIndexDelete', [pointer]);

  @override
  int value(int pointer) => wasm.callInt('TWDerivationPathIndexValue', [pointer]);

  @override
  bool hardened(int pointer) => wasm.callBool('TWDerivationPathIndexHardened', [pointer]);

  @override
  int description(int pointer) => wasm.callInt('TWDerivationPathIndexDescription', [pointer]);

}
