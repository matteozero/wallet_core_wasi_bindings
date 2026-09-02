part of '../../wallet_core_wasi_bindings.dart';

class TWPublicKeyImpl extends TWPublicKeyInterface {
  TWPublicKeyImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithData(int data, int type) => wasm.callInt('TWPublicKeyCreateWithData', [data, type]);

  @override
  void delete(int pointer) => wasm.callVoid('TWPublicKeyDelete', [pointer]);

  @override
  bool isValid(int data, int type) => wasm.callBool('TWPublicKeyIsValid', [data, type]);

  @override
  bool verify(int pk, int signature, int message) => wasm.callBool('TWPublicKeyVerify', [pk, signature, message]);

  @override
  bool verifyAsDER(int pk, int signature, int message) => wasm.callBool('TWPublicKeyVerifyAsDER', [pk, signature, message]);

  @override
  bool verifyZilliqaSchnorr(int pk, int signature, int message) => wasm.callBool('TWPublicKeyVerifyZilliqaSchnorr', [pk, signature, message]);

  @override
  int recover(int signature, int message) => wasm.callInt('TWPublicKeyRecover', [signature, message]);

  @override
  bool isCompressed(int pointer) => wasm.callBool('TWPublicKeyIsCompressed', [pointer]);

  @override
  int compressed(int pointer) => wasm.callInt('TWPublicKeyCompressed', [pointer]);

  @override
  int uncompressed(int pointer) => wasm.callInt('TWPublicKeyUncompressed', [pointer]);

  @override
  int data(int pointer) => wasm.callInt('TWPublicKeyData', [pointer]);

  @override
  int keyType(int pointer) => wasm.callInt('TWPublicKeyKeyType', [pointer]);

  @override
  int description(int pointer) => wasm.callInt('TWPublicKeyDescription', [pointer]);

}
