part of '../../wallet_core_wasi_bindings.dart';

abstract class TWTransactionCompilerInterface {
  int buildInput(int coinType, int from, int to, int amount, int asset, int memo, int chainId);
  int preImageHashes(int coinType, int txInputData);
  int compileWithSignatures(int coinType, int txInputData, int signatures, int publicKeys);
  int compileWithSignaturesAndPubKeyType(int coinType, int txInputData, int signatures, int publicKeys, int pubKeyType);
}
