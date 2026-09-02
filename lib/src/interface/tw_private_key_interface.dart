part of '../../wallet_core_wasi_bindings.dart';

abstract class TWPrivateKeyInterface {
  int create();
  int createWithData(int data);
  int createCopy(int key);
  void delete(int pointer);
  bool isValid(int data, int curve);
  int getPublicKey(int pk, int coinType);
  int getPublicKeyByType(int pk, int pubkeyType);
  int getPublicKeySecp256k1(int pk, bool compressed);
  int getPublicKeyNist256p1(int pk);
  int getPublicKeyEd25519(int pk);
  int getPublicKeyEd25519Blake2b(int pk);
  int getPublicKeyEd25519Cardano(int pk);
  int getPublicKeyCurve25519(int pk);
  int getSharedKey(int pk, int publicKey, int curve);
  int sign(int pk, int digest, int curve);
  int signAsDER(int pk, int digest);
  int signZilliqaSchnorr(int pk, int message);
  int data(int pointer);
}
