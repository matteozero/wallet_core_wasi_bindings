part of '../../wallet_core_wasi_bindings.dart';

class TWAnySignerImpl extends TWAnySignerInterface {
  TWAnySignerImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int sign(int input, int coin) => wasm.callInt('TWAnySignerSign', [input, coin]);

  @override
  int signJSON(int json, int key, int coin) => wasm.callInt('TWAnySignerSignJSON', [json, key, coin]);

  @override
  bool supportsJSON(int coin) => wasm.callBool('TWAnySignerSupportsJSON', [coin]);

  @override
  int plan(int input, int coin) => wasm.callInt('TWAnySignerPlan', [input, coin]);

}
