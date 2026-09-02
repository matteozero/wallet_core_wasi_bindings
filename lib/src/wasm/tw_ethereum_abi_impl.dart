part of '../../wallet_core_wasi_bindings.dart';

class TWEthereumAbiImpl extends TWEthereumAbiInterface {
  TWEthereumAbiImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encode(int fn) => wasm.callInt('TWEthereumAbiEncode', [fn]);

  @override
  bool decodeOutput(int fn, int encoded) => wasm.callBool('TWEthereumAbiDecodeOutput', [fn, encoded]);

  @override
  int decodeCall(int data, int abi) => wasm.callInt('TWEthereumAbiDecodeCall', [data, abi]);

  @override
  int encodeTyped(int messageJson) => wasm.callInt('TWEthereumAbiEncodeTyped', [messageJson]);

  @override
  int getFunctionSignature(int abi) => wasm.callInt('TWEthereumAbiGetFunctionSignature', [abi]);

  @override
  int decodeContractCall(int coin, int input) => wasm.callInt('TWEthereumAbiDecodeContractCall', [coin, input]);

  @override
  int decodeParams(int coin, int input) => wasm.callInt('TWEthereumAbiDecodeParams', [coin, input]);

  @override
  int decodeValue(int coin, int input) => wasm.callInt('TWEthereumAbiDecodeValue', [coin, input]);

  @override
  int encodeFunction(int coin, int input) => wasm.callInt('TWEthereumAbiEncodeFunction', [coin, input]);

}
