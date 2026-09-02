part of '../wallet_core_wasi_bindings.dart';

TWEthereumRlpInterface get _tWEthereumRlpImpl => WalletCoreWasiBindings.backend<TWEthereumRlpInterface>();

class TWEthereumRlp {
  TWEthereumRlp._();

  static Uint8List encode(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWEthereumRlpImpl.encode(coin.value, _inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
