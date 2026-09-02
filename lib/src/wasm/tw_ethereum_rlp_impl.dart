part of '../../wallet_core_wasi_bindings.dart';

class TWEthereumRlpImpl extends TWEthereumRlpInterface {
  TWEthereumRlpImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encode(int coin, int input) => wasm.callInt('TWEthereumRlpEncode', [coin, input]);

}
