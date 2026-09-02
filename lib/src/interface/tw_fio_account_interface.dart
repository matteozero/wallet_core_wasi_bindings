part of '../../wallet_core_wasi_bindings.dart';

abstract class TWFIOAccountInterface {
  int createWithString(int string);
  void delete(int pointer);
  int description(int pointer);
}
