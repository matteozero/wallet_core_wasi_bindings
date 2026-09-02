part of '../../wallet_core_wasi_bindings.dart';

class TWTONMessageSignerImpl extends TWTONMessageSignerInterface {
  TWTONMessageSignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int signMessage(int privateKey, int message) => wasm.callInt('TWTONMessageSignerSignMessage', [privateKey, message]);

}
