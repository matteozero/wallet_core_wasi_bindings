part of '../../wallet_core_wasi_bindings.dart';

abstract class TWCoinTypeConfigurationInterface {
  int getSymbol(int type);
  int getDecimals(int type);
  int getTransactionURL(int type, int transactionID);
  int getAccountURL(int type, int accountID);
  int getID(int type);
  int getName(int type);
  int getNativeTokenName(int type);
}
