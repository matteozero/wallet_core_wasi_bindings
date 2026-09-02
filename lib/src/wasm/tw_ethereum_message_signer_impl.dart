part of '../../wallet_core_wasi_bindings.dart';

class TWEthereumMessageSignerImpl extends TWEthereumMessageSignerInterface {
  TWEthereumMessageSignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int signTypedMessage(int privateKey, int messageJson) => wasm.callInt('TWEthereumMessageSignerSignTypedMessage', [privateKey, messageJson]);

  @override
  int signTypedMessageEip155(int privateKey, int messageJson, int chainId) => wasm.callInt('TWEthereumMessageSignerSignTypedMessageEip155', [privateKey, messageJson, chainId]);

  @override
  int signMessage(int privateKey, int message) => wasm.callInt('TWEthereumMessageSignerSignMessage', [privateKey, message]);

  @override
  int signMessageImmutableX(int privateKey, int message) => wasm.callInt('TWEthereumMessageSignerSignMessageImmutableX', [privateKey, message]);

  @override
  int signMessageEip155(int privateKey, int message, int chainId) => wasm.callInt('TWEthereumMessageSignerSignMessageEip155', [privateKey, message, chainId]);

  @override
  bool verifyMessage(int pubKey, int message, int signature) => wasm.callBool('TWEthereumMessageSignerVerifyMessage', [pubKey, message, signature]);

}
