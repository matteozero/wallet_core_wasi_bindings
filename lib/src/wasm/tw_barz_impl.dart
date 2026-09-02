part of '../../wallet_core_wasi_bindings.dart';

class TWBarzImpl extends TWBarzInterface {
  TWBarzImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int getCounterfactualAddress(int input) => wasm.callInt('TWBarzGetCounterfactualAddress', [input]);

  @override
  int getInitCode(int factory, int publicKey, int verificationFacet, int salt) => wasm.callInt('TWBarzGetInitCode', [factory, publicKey, verificationFacet, salt]);

  @override
  int getFormattedSignature(int signature, int challenge, int authenticatorData, int clientDataJson) => wasm.callInt('TWBarzGetFormattedSignature', [signature, challenge, authenticatorData, clientDataJson]);

  @override
  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId) => wasm.callInt('TWBarzGetPrefixedMsgHash', [msgHash, barzAddress, chainId]);

  @override
  int getDiamondCutCode(int input) => wasm.callInt('TWBarzGetDiamondCutCode', [input]);

}
