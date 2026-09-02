part of '../../wallet_core_wasi_bindings.dart';

class TWTransactionUtilImpl extends TWTransactionUtilInterface {
  TWTransactionUtilImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int calcTxHash(int coinType, int encodedTx) => wasm.callInt('TWTransactionUtilCalcTxHash', [coinType, encodedTx]);

}
