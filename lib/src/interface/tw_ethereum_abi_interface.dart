part of '../../wallet_core_wasi_bindings.dart';

abstract class TWEthereumAbiInterface {
  int encode(int fn);
  bool decodeOutput(int fn, int encoded);
  int decodeCall(int data, int abi);
  int encodeTyped(int messageJson);
  int getFunctionSignature(int abi);
  int decodeContractCall(int coin, int input);
  int decodeParams(int coin, int input);
  int decodeValue(int coin, int input);
  int encodeFunction(int coin, int input);
}
