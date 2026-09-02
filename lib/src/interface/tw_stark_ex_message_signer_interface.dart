part of '../../wallet_core_wasi_bindings.dart';

abstract class TWStarkExMessageSignerInterface {
  int signMessage(int privateKey, int message);
  bool verifyMessage(int pubKey, int message, int signature);
}
