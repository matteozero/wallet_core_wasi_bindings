part of '../../wallet_core_wasi_bindings.dart';

abstract class TWTONMessageSignerInterface {
  int signMessage(int privateKey, int message);
}
