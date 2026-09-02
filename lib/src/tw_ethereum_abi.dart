part of '../wallet_core_wasi_bindings.dart';

TWEthereumAbiInterface get _tWEthereumAbiImpl => WalletCoreWasiBindings.backend<TWEthereumAbiInterface>();

class TWEthereumAbi {
  TWEthereumAbi._();

  static Uint8List encode(TWEthereumAbiFunction fn) {
    final _r = _tWEthereumAbiImpl.encode(fn.pointer);
    return TWData.fromPointer(_r).bytes;
  }

  static bool decodeOutput(TWEthereumAbiFunction fn, Uint8List encoded) {
    final _encodedData = TWData(encoded);

    final _r = _tWEthereumAbiImpl.decodeOutput(fn.pointer, _encodedData.pointer);
    _encodedData.delete();
    return _r;
  }

  static String? decodeCall(Uint8List data, String abi) {
    final _dataData = TWData(data);
final _abiStr = TWString(abi);

    final _r = _tWEthereumAbiImpl.decodeCall(_dataData.pointer, _abiStr.pointer);
    _dataData.delete();
    _abiStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static Uint8List encodeTyped(String messageJson) {
    final _messageJsonStr = TWString(messageJson);

    final _r = _tWEthereumAbiImpl.encodeTyped(_messageJsonStr.pointer);
    _messageJsonStr.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static String? getFunctionSignature(String abi) {
    final _abiStr = TWString(abi);

    final _r = _tWEthereumAbiImpl.getFunctionSignature(_abiStr.pointer);
    _abiStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static Uint8List decodeContractCall(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWEthereumAbiImpl.decodeContractCall(coin.value, _inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List decodeParams(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWEthereumAbiImpl.decodeParams(coin.value, _inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List decodeValue(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWEthereumAbiImpl.decodeValue(coin.value, _inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeFunction(TWCoinType coin, Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWEthereumAbiImpl.encodeFunction(coin.value, _inputData.pointer);
    _inputData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
