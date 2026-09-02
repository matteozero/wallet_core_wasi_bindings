part of '../../wallet_core_wasi_bindings.dart';

class TWLiquidStakingImpl extends TWLiquidStakingInterface {
  TWLiquidStakingImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int buildRequest(int input) => wasm.callInt('TWLiquidStakingBuildRequest', [input]);

}
