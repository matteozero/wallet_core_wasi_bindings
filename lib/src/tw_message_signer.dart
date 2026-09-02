part of '../wallet_core_wasi_bindings.dart';

TWMessageSignerInterface get _tWMessageSignerImpl => WalletCoreWasiBindings.backend<TWMessageSignerInterface>();

class TWMessageSigner extends TWObjectFinalizable {
  TWMessageSigner.fromPointer(int pointer) : super(pointer);

  static Uint8List? sign(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWMessageSignerImpl.sign(coin.value, _inputData.pointer);
    _inputData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static bool verify(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWMessageSignerImpl.verify(coin.value, _inputData.pointer);
    _inputData.delete();
    return _r;
  }

  static Uint8List? preImageHashes(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWMessageSignerImpl.preImageHashes(coin.value, _inputData.pointer);
    _inputData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
