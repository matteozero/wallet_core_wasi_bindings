part of '../../wallet_core_wasi_bindings.dart';

class TWStarkExMessageSignerImpl extends TWStarkExMessageSignerInterface {
  TWStarkExMessageSignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int signMessage(int privateKey, int message) => wasm.callInt('TWStarkExMessageSignerSignMessage', [privateKey, message]);

  @override
  bool verifyMessage(int pubKey, int message, int signature) => wasm.callBool('TWStarkExMessageSignerVerifyMessage', [pubKey, message, signature]);

}
