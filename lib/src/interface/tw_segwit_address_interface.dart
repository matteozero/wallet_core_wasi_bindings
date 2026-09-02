part of '../../wallet_core_wasi_bindings.dart';

abstract class TWSegwitAddressInterface {
  int createWithString(int string);
  int createWithPublicKey(int hrp, int publicKey);
  void delete(int pointer);
  bool equal(int lhs, int rhs);
  bool isValidString(int string);
  int description(int pointer);
  int hRP(int pointer);
  int witnessVersion(int pointer);
  int witnessProgram(int pointer);
}
