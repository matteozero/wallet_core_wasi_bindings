part of '../wallet_core_wasi_bindings.dart';

TWTransactionUtilInterface get _tWTransactionUtilImpl => WalletCoreWasiBindings.backend<TWTransactionUtilInterface>();

class TWTransactionUtil {
  TWTransactionUtil._();

  static String? calcTxHash(TWCoinType coinType, String encodedTx) {
    final _encodedTxStr = TWString(encodedTx);

    final _r = _tWTransactionUtilImpl.calcTxHash(coinType.value, _encodedTxStr.pointer);
    _encodedTxStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

}
