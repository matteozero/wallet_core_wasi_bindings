part of '../../wallet_core_wasi_bindings.dart';

abstract class TWCryptoBoxPublicKeyInterface {
  int createWithData(int data);
  void delete(int pointer);
  bool isValid(int data);
  int data(int pointer, int publicKey);
}
