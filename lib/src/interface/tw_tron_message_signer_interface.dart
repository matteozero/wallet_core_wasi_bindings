part of '../../wallet_core_wasi_bindings.dart';

abstract class TWTronMessageSignerInterface {
  int signMessage(int privateKey, int message);
  bool verifyMessage(int pubKey, int message, int signature);
}
