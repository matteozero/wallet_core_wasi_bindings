part of '../../wallet_core_wasi_bindings.dart';

class TWRippleXAddressImpl extends TWRippleXAddressInterface {
  TWRippleXAddressImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWRippleXAddressCreateWithString', [string]);

  @override
  int createWithPublicKey(int publicKey, int tag) => wasm.callInt('TWRippleXAddressCreateWithPublicKey', [publicKey, tag]);

  @override
  void delete(int pointer) => wasm.callVoid('TWRippleXAddressDelete', [pointer]);

  @override
  bool equal(int lhs, int rhs) => wasm.callBool('TWRippleXAddressEqual', [lhs, rhs]);

  @override
  bool isValidString(int string) => wasm.callBool('TWRippleXAddressIsValidString', [string]);

  @override
  int description(int pointer) => wasm.callInt('TWRippleXAddressDescription', [pointer]);

  @override
  int tag(int pointer) => wasm.callInt('TWRippleXAddressTag', [pointer]);

}
