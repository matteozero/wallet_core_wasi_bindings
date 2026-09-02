part of '../../wallet_core_wasi_bindings.dart';

abstract class TWCryptoBoxSecretKeyInterface {
  int create();
  int createWithData(int data);
  void delete(int pointer);
  bool isValid(int data);
  int getPublicKey(int key);
  int data(int pointer, int secretKey);
}
