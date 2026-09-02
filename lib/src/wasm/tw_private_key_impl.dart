part of '../../wallet_core_wasi_bindings.dart';

class TWPrivateKeyImpl extends TWPrivateKeyInterface {
  TWPrivateKeyImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create() => wasm.callInt('TWPrivateKeyCreate', []);

  @override
  int createWithData(int data) => wasm.callInt('TWPrivateKeyCreateWithData', [data]);

  @override
  int createCopy(int key) => wasm.callInt('TWPrivateKeyCreateCopy', [key]);

  @override
  void delete(int pointer) => wasm.callVoid('TWPrivateKeyDelete', [pointer]);

  @override
  bool isValid(int data, int curve) => wasm.callBool('TWPrivateKeyIsValid', [data, curve]);

  @override
  int getPublicKey(int pk, int coinType) => wasm.callInt('TWPrivateKeyGetPublicKey', [pk, coinType]);

  @override
  int getPublicKeyByType(int pk, int pubkeyType) => wasm.callInt('TWPrivateKeyGetPublicKeyByType', [pk, pubkeyType]);

  @override
  int getPublicKeySecp256k1(int pk, bool compressed) => wasm.callInt('TWPrivateKeyGetPublicKeySecp256k1', [pk, (compressed ? 1 : 0)]);

  @override
  int getPublicKeyNist256p1(int pk) => wasm.callInt('TWPrivateKeyGetPublicKeyNist256p1', [pk]);

  @override
  int getPublicKeyEd25519(int pk) => wasm.callInt('TWPrivateKeyGetPublicKeyEd25519', [pk]);

  @override
  int getPublicKeyEd25519Blake2b(int pk) => wasm.callInt('TWPrivateKeyGetPublicKeyEd25519Blake2b', [pk]);

  @override
  int getPublicKeyEd25519Cardano(int pk) => wasm.callInt('TWPrivateKeyGetPublicKeyEd25519Cardano', [pk]);

  @override
  int getPublicKeyCurve25519(int pk) => wasm.callInt('TWPrivateKeyGetPublicKeyCurve25519', [pk]);

  @override
  int getSharedKey(int pk, int publicKey, int curve) => wasm.callInt('TWPrivateKeyGetSharedKey', [pk, publicKey, curve]);

  @override
  int sign(int pk, int digest, int curve) => wasm.callInt('TWPrivateKeySign', [pk, digest, curve]);

  @override
  int signAsDER(int pk, int digest) => wasm.callInt('TWPrivateKeySignAsDER', [pk, digest]);

  @override
  int signZilliqaSchnorr(int pk, int message) => wasm.callInt('TWPrivateKeySignZilliqaSchnorr', [pk, message]);

  @override
  int data(int pointer) => wasm.callInt('TWPrivateKeyData', [pointer]);

}
