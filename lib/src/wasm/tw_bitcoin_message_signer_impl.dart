part of '../../wallet_core_wasi_bindings.dart';

class TWBitcoinMessageSignerImpl extends TWBitcoinMessageSignerInterface {
  TWBitcoinMessageSignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int signMessage(int privateKey, int address, int message) => wasm.callInt('TWBitcoinMessageSignerSignMessage', [privateKey, address, message]);

  @override
  bool verifyMessage(int address, int message, int signature) => wasm.callBool('TWBitcoinMessageSignerVerifyMessage', [address, message, signature]);

}
