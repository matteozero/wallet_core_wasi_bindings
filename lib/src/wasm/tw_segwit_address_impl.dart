part of '../../wallet_core_wasi_bindings.dart';

class TWSegwitAddressImpl extends TWSegwitAddressInterface {
  TWSegwitAddressImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWSegwitAddressCreateWithString', [string]);

  @override
  int createWithPublicKey(int hrp, int publicKey) => wasm.callInt('TWSegwitAddressCreateWithPublicKey', [hrp, publicKey]);

  @override
  void delete(int pointer) => wasm.callVoid('TWSegwitAddressDelete', [pointer]);

  @override
  bool equal(int lhs, int rhs) => wasm.callBool('TWSegwitAddressEqual', [lhs, rhs]);

  @override
  bool isValidString(int string) => wasm.callBool('TWSegwitAddressIsValidString', [string]);

  @override
  int description(int pointer) => wasm.callInt('TWSegwitAddressDescription', [pointer]);

  @override
  int hRP(int pointer) => wasm.callInt('TWSegwitAddressHRP', [pointer]);

  @override
  int witnessVersion(int pointer) => wasm.callInt('TWSegwitAddressWitnessVersion', [pointer]);

  @override
  int witnessProgram(int pointer) => wasm.callInt('TWSegwitAddressWitnessProgram', [pointer]);

}
