part of '../../wallet_core_wasi_bindings.dart';

class TWTHORChainSwapImpl extends TWTHORChainSwapInterface {
  TWTHORChainSwapImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int buildSwap(int input) => wasm.callInt('TWTHORChainSwapBuildSwap', [input]);

}
