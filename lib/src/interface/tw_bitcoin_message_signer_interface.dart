part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBitcoinMessageSignerInterface {
  int signMessage(int privateKey, int address, int message);
  bool verifyMessage(int address, int message, int signature);
}
