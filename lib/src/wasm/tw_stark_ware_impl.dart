part of '../../wallet_core_wasi_bindings.dart';

class TWStarkWareImpl extends TWStarkWareInterface {
  TWStarkWareImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int getStarkKeyFromSignature(int derivationPath, int signature) => wasm.callInt('TWStarkWareGetStarkKeyFromSignature', [derivationPath, signature]);

}
