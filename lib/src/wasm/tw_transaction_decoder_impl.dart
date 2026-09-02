part of '../../wallet_core_wasi_bindings.dart';

class TWTransactionDecoderImpl extends TWTransactionDecoderInterface {
  TWTransactionDecoderImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int decode(int coinType, int encodedTx) => wasm.callInt('TWTransactionDecoderDecode', [coinType, encodedTx]);

}
