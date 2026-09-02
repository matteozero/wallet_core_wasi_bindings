part of '../../wallet_core_wasi_bindings.dart';

class TWCoinTypeConfigurationImpl extends TWCoinTypeConfigurationInterface {
  TWCoinTypeConfigurationImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int getSymbol(int type) => wasm.callInt('TWCoinTypeConfigurationGetSymbol', [type]);

  @override
  int getDecimals(int type) => wasm.callInt('TWCoinTypeConfigurationGetDecimals', [type]);

  @override
  int getTransactionURL(int type, int transactionID) => wasm.callInt('TWCoinTypeConfigurationGetTransactionURL', [type, transactionID]);

  @override
  int getAccountURL(int type, int accountID) => wasm.callInt('TWCoinTypeConfigurationGetAccountURL', [type, accountID]);

  @override
  int getID(int type) => wasm.callInt('TWCoinTypeConfigurationGetID', [type]);

  @override
  int getName(int type) => wasm.callInt('TWCoinTypeConfigurationGetName', [type]);

  @override
  int getNativeTokenName(int type) => wasm.callInt('TWCoinTypeConfigurationGetNativeTokenName', [type]);

}
