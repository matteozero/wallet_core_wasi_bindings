part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBarzInterface {
  int getCounterfactualAddress(int input);
  int getInitCode(int factory, int publicKey, int verificationFacet, int salt);
  int getFormattedSignature(int signature, int challenge, int authenticatorData, int clientDataJson);
  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId);
  int getDiamondCutCode(int input);
}
