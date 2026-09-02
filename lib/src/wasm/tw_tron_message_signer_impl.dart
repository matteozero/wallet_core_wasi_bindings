part of '../../wallet_core_wasi_bindings.dart';

class TWTronMessageSignerImpl extends TWTronMessageSignerInterface {
  TWTronMessageSignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int signMessage(int privateKey, int message) => wasm.callInt('TWTronMessageSignerSignMessage', [privateKey, message]);

  @override
  bool verifyMessage(int pubKey, int message, int signature) => wasm.callBool('TWTronMessageSignerVerifyMessage', [pubKey, message, signature]);

}
