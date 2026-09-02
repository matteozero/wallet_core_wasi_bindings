part of '../../wallet_core_wasi_bindings.dart';

class TWSolanaTransactionImpl extends TWSolanaTransactionInterface {
  TWSolanaTransactionImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int updateBlockhashAndSign(int encodedTx, int recentBlockhash, int privateKeys) => wasm.callInt('TWSolanaTransactionUpdateBlockhashAndSign', [encodedTx, recentBlockhash, privateKeys]);

  @override
  int getComputeUnitPrice(int encodedTx) => wasm.callInt('TWSolanaTransactionGetComputeUnitPrice', [encodedTx]);

  @override
  int getComputeUnitLimit(int encodedTx) => wasm.callInt('TWSolanaTransactionGetComputeUnitLimit', [encodedTx]);

  @override
  int setComputeUnitPrice(int encodedTx, int price) => wasm.callInt('TWSolanaTransactionSetComputeUnitPrice', [encodedTx, price]);

  @override
  int setComputeUnitLimit(int encodedTx, int limit) => wasm.callInt('TWSolanaTransactionSetComputeUnitLimit', [encodedTx, limit]);

  @override
  int setFeePayer(int encodedTx, int feePayer) => wasm.callInt('TWSolanaTransactionSetFeePayer', [encodedTx, feePayer]);

  @override
  int insertInstruction(int encodedTx, int insertAt, int instruction) => wasm.callInt('TWSolanaTransactionInsertInstruction', [encodedTx, insertAt, instruction]);

  @override
  int insertTransferInstruction(int encodedTx, int insertAt, int from, int to, int lamports) => wasm.callInt('TWSolanaTransactionInsertTransferInstruction', [encodedTx, insertAt, from, to, lamports]);

}
