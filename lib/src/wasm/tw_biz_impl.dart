part of '../../wallet_core_wasi_bindings.dart';

class TWBizImpl extends TWBizInterface {
  TWBizImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int getEncodedHash(int chainId, int codeAddress, int codeName, int codeVersion, int typeHash, int domainSeparatorHash, int sender, int userOpHash) => wasm.callInt('TWBizGetEncodedHash', [chainId, codeAddress, codeName, codeVersion, typeHash, domainSeparatorHash, sender, userOpHash]);

  @override
  int getSignedHash(int hash, int privateKey) => wasm.callInt('TWBizGetSignedHash', [hash, privateKey]);

  @override
  int signExecuteWithSignatureCall(int input) => wasm.callInt('TWBizSignExecuteWithSignatureCall', [input]);

}
