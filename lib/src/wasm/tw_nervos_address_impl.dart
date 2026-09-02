part of '../../wallet_core_wasi_bindings.dart';

class TWNervosAddressImpl extends TWNervosAddressInterface {
  TWNervosAddressImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWNervosAddressCreateWithString', [string]);

  @override
  void delete(int pointer) => wasm.callVoid('TWNervosAddressDelete', [pointer]);

  @override
  bool equal(int lhs, int rhs) => wasm.callBool('TWNervosAddressEqual', [lhs, rhs]);

  @override
  bool isValidString(int string) => wasm.callBool('TWNervosAddressIsValidString', [string]);

  @override
  int description(int pointer) => wasm.callInt('TWNervosAddressDescription', [pointer]);

  @override
  int codeHash(int pointer) => wasm.callInt('TWNervosAddressCodeHash', [pointer]);

  @override
  int hashType(int pointer) => wasm.callInt('TWNervosAddressHashType', [pointer]);

  @override
  int args(int pointer) => wasm.callInt('TWNervosAddressArgs', [pointer]);

}
