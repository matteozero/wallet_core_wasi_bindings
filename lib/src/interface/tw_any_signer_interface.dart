part of '../../wallet_core_wasi_bindings.dart';

abstract class TWAnySignerInterface {
  int sign(int input, int coin);
  int signJSON(int json, int key, int coin);
  bool supportsJSON(int coin);
  int plan(int input, int coin);
}
