part of '../../wallet_core_wasi_bindings.dart';

class TWEip7702Impl extends TWEip7702Interface {
  TWEip7702Impl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int signAuthorization(int chainId, int contractAddress, int nonce, int privateKey) => wasm.callInt('TWEip7702SignAuthorization', [chainId, contractAddress, nonce, privateKey]);

  @override
  int getAuthorizationHash(int chainId, int contractAddress, int nonce) => wasm.callInt('TWEip7702GetAuthorizationHash', [chainId, contractAddress, nonce]);

}
