part of '../../wallet_core_wasi_bindings.dart';

abstract class TWNervosAddressInterface {
  int createWithString(int string);
  void delete(int pointer);
  bool equal(int lhs, int rhs);
  bool isValidString(int string);
  int description(int pointer);
  int codeHash(int pointer);
  int hashType(int pointer);
  int args(int pointer);
}
