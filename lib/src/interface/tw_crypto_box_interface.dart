part of '../../wallet_core_wasi_bindings.dart';

abstract class TWCryptoBoxInterface {
  int encryptEasy(int mySecret, int otherPubkey, int message);
  int decryptEasy(int mySecret, int otherPubkey, int encrypted);
}
