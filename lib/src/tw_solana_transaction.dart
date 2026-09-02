part of '../wallet_core_wasi_bindings.dart';

TWSolanaTransactionInterface get _tWSolanaTransactionImpl => WalletCoreWasiBindings.backend<TWSolanaTransactionInterface>();

class TWSolanaTransaction extends TWObjectFinalizable {
  TWSolanaTransaction.fromPointer(int pointer) : super(pointer);

  static Uint8List? updateBlockhashAndSign(String encodedTx, String recentBlockhash, TWDataVector privateKeys) {
    final _encodedTxStr = TWString(encodedTx);
final _recentBlockhashStr = TWString(recentBlockhash);

    final _r = _tWSolanaTransactionImpl.updateBlockhashAndSign(_encodedTxStr.pointer, _recentBlockhashStr.pointer, privateKeys.pointer);
    _encodedTxStr.delete();
    _recentBlockhashStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static String? getComputeUnitPrice(String encodedTx) {
    final _encodedTxStr = TWString(encodedTx);

    final _r = _tWSolanaTransactionImpl.getComputeUnitPrice(_encodedTxStr.pointer);
    _encodedTxStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? getComputeUnitLimit(String encodedTx) {
    final _encodedTxStr = TWString(encodedTx);

    final _r = _tWSolanaTransactionImpl.getComputeUnitLimit(_encodedTxStr.pointer);
    _encodedTxStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? setComputeUnitPrice(String encodedTx, String price) {
    final _encodedTxStr = TWString(encodedTx);
final _priceStr = TWString(price);

    final _r = _tWSolanaTransactionImpl.setComputeUnitPrice(_encodedTxStr.pointer, _priceStr.pointer);
    _encodedTxStr.delete();
    _priceStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? setComputeUnitLimit(String encodedTx, String limit) {
    final _encodedTxStr = TWString(encodedTx);
final _limitStr = TWString(limit);

    final _r = _tWSolanaTransactionImpl.setComputeUnitLimit(_encodedTxStr.pointer, _limitStr.pointer);
    _encodedTxStr.delete();
    _limitStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? setFeePayer(String encodedTx, String feePayer) {
    final _encodedTxStr = TWString(encodedTx);
final _feePayerStr = TWString(feePayer);

    final _r = _tWSolanaTransactionImpl.setFeePayer(_encodedTxStr.pointer, _feePayerStr.pointer);
    _encodedTxStr.delete();
    _feePayerStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? insertInstruction(String encodedTx, int insertAt, String instruction) {
    final _encodedTxStr = TWString(encodedTx);
final _instructionStr = TWString(instruction);

    final _r = _tWSolanaTransactionImpl.insertInstruction(_encodedTxStr.pointer, insertAt, _instructionStr.pointer);
    _encodedTxStr.delete();
    _instructionStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? insertTransferInstruction(String encodedTx, int insertAt, String from, String to, String lamports) {
    final _encodedTxStr = TWString(encodedTx);
final _fromStr = TWString(from);
final _toStr = TWString(to);
final _lamportsStr = TWString(lamports);

    final _r = _tWSolanaTransactionImpl.insertTransferInstruction(_encodedTxStr.pointer, insertAt, _fromStr.pointer, _toStr.pointer, _lamportsStr.pointer);
    _encodedTxStr.delete();
    _fromStr.delete();
    _toStr.delete();
    _lamportsStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

}
