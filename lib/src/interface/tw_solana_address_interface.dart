part of '../../wallet_core_wasi_bindings.dart';

abstract class TWSolanaAddressInterface {
  int createWithString(int string);
  void delete(int pointer);
  int defaultTokenAddress(int address, int tokenMintAddress);
  int token2022Address(int address, int tokenMintAddress);
  int description(int pointer);
}
