part of '../../wallet_core_wasi_bindings.dart';

class TWCryptoBoxSecretKeyImpl extends TWCryptoBoxSecretKeyInterface {
  TWCryptoBoxSecretKeyImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create() => wasm.callInt('TWCryptoBoxSecretKeyCreate', []);

  @override
  int createWithData(int data) => wasm.callInt('TWCryptoBoxSecretKeyCreateWithData', [data]);

  @override
  void delete(int pointer) => wasm.callVoid('TWCryptoBoxSecretKeyDelete', [pointer]);

  @override
  bool isValid(int data) => wasm.callBool('TWCryptoBoxSecretKeyIsValid', [data]);

  @override
  int getPublicKey(int key) => wasm.callInt('TWCryptoBoxSecretKeyGetPublicKey', [key]);

  @override
  int data(int pointer, int secretKey) => wasm.callInt('TWCryptoBoxSecretKeyData', [pointer, secretKey]);

}
