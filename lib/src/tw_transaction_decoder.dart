part of '../wallet_core_wasi_bindings.dart';

TWTransactionDecoderInterface get _tWTransactionDecoderImpl => WalletCoreWasiBindings.backend<TWTransactionDecoderInterface>();

class TWTransactionDecoder {
  TWTransactionDecoder._();

  static Uint8List decode(TWCoinType coinType, Uint8List encodedTx) {
    final _encodedTxData = TWData(encodedTx);

    final _r = _tWTransactionDecoderImpl.decode(coinType.value, _encodedTxData.pointer);
    _encodedTxData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
