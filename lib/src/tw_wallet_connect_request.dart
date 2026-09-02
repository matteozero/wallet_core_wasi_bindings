part of '../wallet_core_wasi_bindings.dart';

TWWalletConnectRequestInterface get _tWWalletConnectRequestImpl => WalletCoreWasiBindings.backend<TWWalletConnectRequestInterface>();

class TWWalletConnectRequest extends TWObjectFinalizable {
  TWWalletConnectRequest.fromPointer(int pointer) : super(pointer);

  static Uint8List parse(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWWalletConnectRequestImpl.parse(coin.value, _inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
