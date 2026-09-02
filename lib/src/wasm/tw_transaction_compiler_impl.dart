part of '../../wallet_core_wasi_bindings.dart';

class TWTransactionCompilerImpl extends TWTransactionCompilerInterface {
  TWTransactionCompilerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int buildInput(int coinType, int from, int to, int amount, int asset, int memo, int chainId) => wasm.callInt('TWTransactionCompilerBuildInput', [coinType, from, to, amount, asset, memo, chainId]);

  @override
  int preImageHashes(int coinType, int txInputData) => wasm.callInt('TWTransactionCompilerPreImageHashes', [coinType, txInputData]);

  @override
  int compileWithSignatures(int coinType, int txInputData, int signatures, int publicKeys) => wasm.callInt('TWTransactionCompilerCompileWithSignatures', [coinType, txInputData, signatures, publicKeys]);

  @override
  int compileWithSignaturesAndPubKeyType(int coinType, int txInputData, int signatures, int publicKeys, int pubKeyType) => wasm.callInt('TWTransactionCompilerCompileWithSignaturesAndPubKeyType', [coinType, txInputData, signatures, publicKeys, pubKeyType]);

}
