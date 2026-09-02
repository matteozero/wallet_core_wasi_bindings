part of '../../wallet_core_wasi_bindings.dart';

class TWBizPasskeySessionImpl extends TWBizPasskeySessionInterface {
  TWBizPasskeySessionImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encodeRegisterSessionCall(int sessionPasskeyPublicKey, int validUntilTimestamp) => wasm.callInt('TWBizPasskeySessionEncodeRegisterSessionCall', [sessionPasskeyPublicKey, validUntilTimestamp]);

  @override
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey) => wasm.callInt('TWBizPasskeySessionEncodeRemoveSessionCall', [sessionPasskeyPublicKey]);

  @override
  int encodePasskeySessionNonce(int nonce) => wasm.callInt('TWBizPasskeySessionEncodePasskeySessionNonce', [nonce]);

  @override
  int encodeExecuteWithPasskeySessionCall(int input) => wasm.callInt('TWBizPasskeySessionEncodeExecuteWithPasskeySessionCall', [input]);

  @override
  int signExecuteWithSignatureCall(int input) => wasm.callInt('TWBizPasskeySessionSignExecuteWithSignatureCall', [input]);

}
