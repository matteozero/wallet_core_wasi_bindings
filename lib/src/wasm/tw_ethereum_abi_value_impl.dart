part of '../../wallet_core_wasi_bindings.dart';

class TWEthereumAbiValueImpl extends TWEthereumAbiValueInterface {
  TWEthereumAbiValueImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encodeBool(bool value) => wasm.callInt('TWEthereumAbiValueEncodeBool', [(value ? 1 : 0)]);

  @override
  int encodeInt32(int value) => wasm.callInt('TWEthereumAbiValueEncodeInt32', [value]);

  @override
  int encodeUInt32(int value) => wasm.callInt('TWEthereumAbiValueEncodeUInt32', [value]);

  @override
  int encodeInt256(int value) => wasm.callInt('TWEthereumAbiValueEncodeInt256', [value]);

  @override
  int encodeUInt256(int value) => wasm.callInt('TWEthereumAbiValueEncodeUInt256', [value]);

  @override
  int encodeAddress(int value) => wasm.callInt('TWEthereumAbiValueEncodeAddress', [value]);

  @override
  int encodeString(int value) => wasm.callInt('TWEthereumAbiValueEncodeString', [value]);

  @override
  int encodeBytes(int value) => wasm.callInt('TWEthereumAbiValueEncodeBytes', [value]);

  @override
  int encodeBytesDyn(int value) => wasm.callInt('TWEthereumAbiValueEncodeBytesDyn', [value]);

  @override
  int decodeUInt256(int input) => wasm.callInt('TWEthereumAbiValueDecodeUInt256', [input]);

  @override
  int decodeValue(int input, int type) => wasm.callInt('TWEthereumAbiValueDecodeValue', [input, type]);

  @override
  int decodeArray(int input, int type) => wasm.callInt('TWEthereumAbiValueDecodeArray', [input, type]);

}
