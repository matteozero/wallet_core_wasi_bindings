part of '../../wallet_core_wasi_bindings.dart';

class TWCryptoBoxPublicKeyImpl extends TWCryptoBoxPublicKeyInterface {
  TWCryptoBoxPublicKeyImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithData(int data) => wasm.callInt('TWCryptoBoxPublicKeyCreateWithData', [data]);

  @override
  void delete(int pointer) => wasm.callVoid('TWCryptoBoxPublicKeyDelete', [pointer]);

  @override
  bool isValid(int data) => wasm.callBool('TWCryptoBoxPublicKeyIsValid', [data]);

  @override
  int data(int pointer, int publicKey) => wasm.callInt('TWCryptoBoxPublicKeyData', [pointer, publicKey]);

}
