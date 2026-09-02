part of '../../wallet_core_wasi_bindings.dart';

class TWTezosMessageSignerImpl extends TWTezosMessageSignerInterface {
  TWTezosMessageSignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int formatMessage(int message, int url) => wasm.callInt('TWTezosMessageSignerFormatMessage', [message, url]);

  @override
  int inputToPayload(int message) => wasm.callInt('TWTezosMessageSignerInputToPayload', [message]);

  @override
  int signMessage(int privateKey, int message) => wasm.callInt('TWTezosMessageSignerSignMessage', [privateKey, message]);

  @override
  bool verifyMessage(int pubKey, int message, int signature) => wasm.callBool('TWTezosMessageSignerVerifyMessage', [pubKey, message, signature]);

}
