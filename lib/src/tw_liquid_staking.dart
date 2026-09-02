part of '../wallet_core_wasi_bindings.dart';

TWLiquidStakingInterface get _tWLiquidStakingImpl => WalletCoreWasiBindings.backend<TWLiquidStakingInterface>();

class TWLiquidStaking {
  TWLiquidStaking._();

  static Uint8List buildRequest(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWLiquidStakingImpl.buildRequest(_inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
