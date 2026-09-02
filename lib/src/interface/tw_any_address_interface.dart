part of '../../wallet_core_wasi_bindings.dart';

abstract class TWAnyAddressInterface {
  int createWithString(int string, int coin);
  int createBech32(int string, int coin, int hrp);
  int createSS58(int string, int coin, int ss58Prefix);
  int createWithPublicKey(int publicKey, int coin);
  int createWithPublicKeyDerivation(int publicKey, int coin, int derivation);
  int createBech32WithPublicKey(int publicKey, int coin, int hrp);
  int createSS58WithPublicKey(int publicKey, int coin, int ss58Prefix);
  int createWithPublicKeyFilecoinAddressType(int publicKey, int filecoinAddressType);
  void delete(int pointer);
  bool equal(int lhs, int rhs);
  bool isValid(int string, int coin);
  bool isValidBech32(int string, int coin, int hrp);
  bool isValidSS58(int string, int coin, int ss58Prefix);
  int createWithPublicKeyFiroAddressType(int publicKey, int firoAddressType);
  int description(int pointer);
  int coin(int pointer);
  int data(int pointer);
}
