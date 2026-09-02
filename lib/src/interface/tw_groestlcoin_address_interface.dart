part of '../../wallet_core_wasi_bindings.dart';

abstract class TWGroestlcoinAddressInterface {
  int createWithString(int string);
  int createWithPublicKey(int publicKey, int prefix);
  void delete(int pointer);
  bool equal(int lhs, int rhs);
  bool isValidString(int string);
  int description(int pointer);
}
