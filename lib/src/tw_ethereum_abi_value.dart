part of '../wallet_core_wasi_bindings.dart';

TWEthereumAbiValueInterface get _tWEthereumAbiValueImpl => WalletCoreWasiBindings.backend<TWEthereumAbiValueInterface>();

class TWEthereumAbiValue {
  TWEthereumAbiValue._();

  static Uint8List encodeBool(bool value) {
    final _r = _tWEthereumAbiValueImpl.encodeBool(value);
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeInt32(int value) {
    final _r = _tWEthereumAbiValueImpl.encodeInt32(value);
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeUInt32(int value) {
    final _r = _tWEthereumAbiValueImpl.encodeUInt32(value);
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeInt256(Uint8List value) {
    final _valueData = TWData(value);

    final _r = _tWEthereumAbiValueImpl.encodeInt256(_valueData.pointer);
    _valueData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeUInt256(Uint8List value) {
    final _valueData = TWData(value);

    final _r = _tWEthereumAbiValueImpl.encodeUInt256(_valueData.pointer);
    _valueData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeAddress(Uint8List value) {
    final _valueData = TWData(value);

    final _r = _tWEthereumAbiValueImpl.encodeAddress(_valueData.pointer);
    _valueData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeString(String value) {
    final _valueStr = TWString(value);

    final _r = _tWEthereumAbiValueImpl.encodeString(_valueStr.pointer);
    _valueStr.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeBytes(Uint8List value) {
    final _valueData = TWData(value);

    final _r = _tWEthereumAbiValueImpl.encodeBytes(_valueData.pointer);
    _valueData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List encodeBytesDyn(Uint8List value) {
    final _valueData = TWData(value);

    final _r = _tWEthereumAbiValueImpl.encodeBytesDyn(_valueData.pointer);
    _valueData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static String decodeUInt256(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWEthereumAbiValueImpl.decodeUInt256(_inputData.pointer);
    _inputData.delete();
    return TWString.fromPointer(_r).value;
  }

  static String decodeValue(Uint8List input, String type) {
    final _inputData = TWData(input);
final _typeStr = TWString(type);

    final _r = _tWEthereumAbiValueImpl.decodeValue(_inputData.pointer, _typeStr.pointer);
    _inputData.delete();
    _typeStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String decodeArray(Uint8List input, String type) {
    final _inputData = TWData(input);
final _typeStr = TWString(type);

    final _r = _tWEthereumAbiValueImpl.decodeArray(_inputData.pointer, _typeStr.pointer);
    _inputData.delete();
    _typeStr.delete();
    return TWString.fromPointer(_r).value;
  }

}
