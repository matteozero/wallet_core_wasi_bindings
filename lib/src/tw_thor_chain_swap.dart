part of '../wallet_core_wasi_bindings.dart';

TWTHORChainSwapInterface get _tWTHORChainSwapImpl => WalletCoreWasiBindings.backend<TWTHORChainSwapInterface>();

class TWTHORChainSwap {
  TWTHORChainSwap._();

  static Uint8List buildSwap(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWTHORChainSwapImpl.buildSwap(_inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
