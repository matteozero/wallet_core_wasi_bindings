part of '../../wallet_core_wasi_bindings.dart';

abstract class TWRippleXAddressInterface {
  int createWithString(int string);
  int createWithPublicKey(int publicKey, int tag);
  void delete(int pointer);
  bool equal(int lhs, int rhs);
  bool isValidString(int string);
  int description(int pointer);
  int tag(int pointer);
}
