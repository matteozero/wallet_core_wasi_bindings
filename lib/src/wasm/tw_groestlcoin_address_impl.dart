part of '../../wallet_core_wasi_bindings.dart';

class TWGroestlcoinAddressImpl extends TWGroestlcoinAddressInterface {
  TWGroestlcoinAddressImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWGroestlcoinAddressCreateWithString', [string]);

  @override
  int createWithPublicKey(int publicKey, int prefix) => wasm.callInt('TWGroestlcoinAddressCreateWithPublicKey', [publicKey, prefix]);

  @override
  void delete(int pointer) => wasm.callVoid('TWGroestlcoinAddressDelete', [pointer]);

  @override
  bool equal(int lhs, int rhs) => wasm.callBool('TWGroestlcoinAddressEqual', [lhs, rhs]);

  @override
  bool isValidString(int string) => wasm.callBool('TWGroestlcoinAddressIsValidString', [string]);

  @override
  int description(int pointer) => wasm.callInt('TWGroestlcoinAddressDescription', [pointer]);

}
