part of '../../wallet_core_wasi_bindings.dart';

abstract class TWDerivationPathInterface {
  int create(int purpose, int coin, int account, int change, int address);
  int createWithString(int string);
  void delete(int pointer);
  int indexAt(int path, int index);
  int indicesCount(int path);
  int purpose(int pointer);
  int coin(int pointer);
  int account(int pointer);
  int change(int pointer);
  int address(int pointer);
  int description(int pointer);
}
