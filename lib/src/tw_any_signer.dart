part of '../wallet_core_wasi_bindings.dart';

TWAnySignerInterface get _tWAnySignerImpl => WalletCoreWasiBindings.backend<TWAnySignerInterface>();

class TWAnySigner {
  TWAnySigner._();

  static Uint8List sign(Uint8List input, TWCoinType coin) {
    final _inputData = TWData(input);

    final _r = _tWAnySignerImpl.sign(_inputData.pointer, coin.value);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static String signJSON(String json, Uint8List key, TWCoinType coin) {
    final _jsonStr = TWString(json);
final _keyData = TWData(key);

    final _r = _tWAnySignerImpl.signJSON(_jsonStr.pointer, _keyData.pointer, coin.value);
    _jsonStr.delete();
    _keyData.delete();
    return TWString.fromPointer(_r).value;
  }

  static bool supportsJSON(TWCoinType coin) {
    final _r = _tWAnySignerImpl.supportsJSON(coin.value);
    return _r;
  }

  static Uint8List plan(Uint8List input, TWCoinType coin) {
    final _inputData = TWData(input);

    final _r = _tWAnySignerImpl.plan(_inputData.pointer, coin.value);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
