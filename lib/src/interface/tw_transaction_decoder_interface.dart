part of '../../wallet_core_wasi_bindings.dart';

abstract class TWTransactionDecoderInterface {
  int decode(int coinType, int encodedTx);
}
