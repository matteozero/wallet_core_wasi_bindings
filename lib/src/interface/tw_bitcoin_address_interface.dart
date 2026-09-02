part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBitcoinAddressInterface {
  int createWithString(int string);
  int createWithData(int data);
  int createWithPublicKey(int publicKey, int prefix);
  void delete(int pointer);
  bool equal(int lhs, int rhs);
  bool isValid(int data);
  bool isValidString(int string);
  int description(int pointer);
  int prefix(int pointer);
  int keyhash(int pointer);
}
