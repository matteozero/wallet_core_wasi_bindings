part of '../../wallet_core_wasi_bindings.dart';

class TWMessageSignerImpl extends TWMessageSignerInterface {
  TWMessageSignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int sign(int coin, int input) => wasm.callInt('TWMessageSignerSign', [coin, input]);

  @override
  bool verify(int coin, int input) => wasm.callBool('TWMessageSignerVerify', [coin, input]);

  @override
  int preImageHashes(int coin, int input) => wasm.callInt('TWMessageSignerPreImageHashes', [coin, input]);

}
