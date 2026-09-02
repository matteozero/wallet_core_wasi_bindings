part of '../wallet_core_wasi_bindings.dart';

TWCoinTypeConfigurationInterface get _tWCoinTypeConfigurationImpl => WalletCoreWasiBindings.backend<TWCoinTypeConfigurationInterface>();

class TWCoinTypeConfiguration {
  TWCoinTypeConfiguration._();

  static String getSymbol(TWCoinType type) {
    final _r = _tWCoinTypeConfigurationImpl.getSymbol(type.value);
    return TWString.fromPointer(_r).value;
  }

  static int getDecimals(TWCoinType type) {
    final _r = _tWCoinTypeConfigurationImpl.getDecimals(type.value);
    return _r;
  }

  static String getTransactionURL(TWCoinType type, String transactionID) {
    final _transactionIDStr = TWString(transactionID);

    final _r = _tWCoinTypeConfigurationImpl.getTransactionURL(type.value, _transactionIDStr.pointer);
    _transactionIDStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String getAccountURL(TWCoinType type, String accountID) {
    final _accountIDStr = TWString(accountID);

    final _r = _tWCoinTypeConfigurationImpl.getAccountURL(type.value, _accountIDStr.pointer);
    _accountIDStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String getID(TWCoinType type) {
    final _r = _tWCoinTypeConfigurationImpl.getID(type.value);
    return TWString.fromPointer(_r).value;
  }

  static String getName(TWCoinType type) {
    final _r = _tWCoinTypeConfigurationImpl.getName(type.value);
    return TWString.fromPointer(_r).value;
  }

  static String getNativeTokenName(TWCoinType type) {
    final _r = _tWCoinTypeConfigurationImpl.getNativeTokenName(type.value);
    return TWString.fromPointer(_r).value;
  }

}
