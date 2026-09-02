part of '../../wallet_core_wasi_bindings.dart';

abstract class TWDerivationPathIndexInterface {
  int create(int value, bool hardened);
  void delete(int pointer);
  int value(int pointer);
  bool hardened(int pointer);
  int description(int pointer);
}
