part of '../../wallet_core_wasi_bindings.dart';

class TWBitcoinAddressImpl extends TWBitcoinAddressInterface {
  TWBitcoinAddressImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWBitcoinAddressCreateWithString', [string]);

  @override
  int createWithData(int data) => wasm.callInt('TWBitcoinAddressCreateWithData', [data]);

  @override
  int createWithPublicKey(int publicKey, int prefix) => wasm.callInt('TWBitcoinAddressCreateWithPublicKey', [publicKey, prefix]);

  @override
  void delete(int pointer) => wasm.callVoid('TWBitcoinAddressDelete', [pointer]);

  @override
  bool equal(int lhs, int rhs) => wasm.callBool('TWBitcoinAddressEqual', [lhs, rhs]);

  @override
  bool isValid(int data) => wasm.callBool('TWBitcoinAddressIsValid', [data]);

  @override
  bool isValidString(int string) => wasm.callBool('TWBitcoinAddressIsValidString', [string]);

  @override
  int description(int pointer) => wasm.callInt('TWBitcoinAddressDescription', [pointer]);

  @override
  int prefix(int pointer) => wasm.callInt('TWBitcoinAddressPrefix', [pointer]);

  @override
  int keyhash(int pointer) => wasm.callInt('TWBitcoinAddressKeyhash', [pointer]);

}
