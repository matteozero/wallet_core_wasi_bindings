part of '../wallet_core_wasi_bindings.dart';

TWTransactionCompilerInterface get _tWTransactionCompilerImpl => WalletCoreWasiBindings.backend<TWTransactionCompilerInterface>();

class TWTransactionCompiler {
  TWTransactionCompiler._();

  static Uint8List buildInput(TWCoinType coinType, String from, String to, String amount, String asset, String memo, String chainId) {
    final _fromStr = TWString(from);
final _toStr = TWString(to);
final _amountStr = TWString(amount);
final _assetStr = TWString(asset);
final _memoStr = TWString(memo);
final _chainIdStr = TWString(chainId);

    final _r = _tWTransactionCompilerImpl.buildInput(coinType.value, _fromStr.pointer, _toStr.pointer, _amountStr.pointer, _assetStr.pointer, _memoStr.pointer, _chainIdStr.pointer);
    _fromStr.delete();
    _toStr.delete();
    _amountStr.delete();
    _assetStr.delete();
    _memoStr.delete();
    _chainIdStr.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List preImageHashes(TWCoinType coinType, Uint8List txInputData) {
    final _txInputDataData = TWData(txInputData);

    final _r = _tWTransactionCompilerImpl.preImageHashes(coinType.value, _txInputDataData.pointer);
    _txInputDataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List compileWithSignatures(TWCoinType coinType, Uint8List txInputData, TWDataVector signatures, TWDataVector publicKeys) {
    final _txInputDataData = TWData(txInputData);

    final _r = _tWTransactionCompilerImpl.compileWithSignatures(coinType.value, _txInputDataData.pointer, signatures.pointer, publicKeys.pointer);
    _txInputDataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List compileWithSignaturesAndPubKeyType(TWCoinType coinType, Uint8List txInputData, TWDataVector signatures, TWDataVector publicKeys, TWPublicKeyType pubKeyType) {
    final _txInputDataData = TWData(txInputData);

    final _r = _tWTransactionCompilerImpl.compileWithSignaturesAndPubKeyType(coinType.value, _txInputDataData.pointer, signatures.pointer, publicKeys.pointer, pubKeyType.value);
    _txInputDataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
