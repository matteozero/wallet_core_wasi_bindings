part of '../../wallet_core_wasi_bindings.dart';

abstract class TWMessageSignerInterface {
  int sign(int coin, int input);
  bool verify(int coin, int input);
  int preImageHashes(int coin, int input);
}
