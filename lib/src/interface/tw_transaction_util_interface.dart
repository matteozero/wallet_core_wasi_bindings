part of '../../wallet_core_wasi_bindings.dart';

abstract class TWTransactionUtilInterface {
  int calcTxHash(int coinType, int encodedTx);
}
