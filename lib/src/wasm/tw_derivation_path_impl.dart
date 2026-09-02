part of '../../wallet_core_wasi_bindings.dart';

class TWDerivationPathImpl extends TWDerivationPathInterface {
  TWDerivationPathImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create(int purpose, int coin, int account, int change, int address) => wasm.callInt('TWDerivationPathCreate', [purpose, coin, account, change, address]);

  @override
  int createWithString(int string) => wasm.callInt('TWDerivationPathCreateWithString', [string]);

  @override
  void delete(int pointer) => wasm.callVoid('TWDerivationPathDelete', [pointer]);

  @override
  int indexAt(int path, int index) => wasm.callInt('TWDerivationPathIndexAt', [path, index]);

  @override
  int indicesCount(int path) => wasm.callInt('TWDerivationPathIndicesCount', [path]);

  @override
  int purpose(int pointer) => wasm.callInt('TWDerivationPathPurpose', [pointer]);

  @override
  int coin(int pointer) => wasm.callInt('TWDerivationPathCoin', [pointer]);

  @override
  int account(int pointer) => wasm.callInt('TWDerivationPathAccount', [pointer]);

  @override
  int change(int pointer) => wasm.callInt('TWDerivationPathChange', [pointer]);

  @override
  int address(int pointer) => wasm.callInt('TWDerivationPathAddress', [pointer]);

  @override
  int description(int pointer) => wasm.callInt('TWDerivationPathDescription', [pointer]);

}
