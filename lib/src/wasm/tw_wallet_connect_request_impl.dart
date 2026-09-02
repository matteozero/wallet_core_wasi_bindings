part of '../../wallet_core_wasi_bindings.dart';

class TWWalletConnectRequestImpl extends TWWalletConnectRequestInterface {
  TWWalletConnectRequestImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int parse(int coin, int input) => wasm.callInt('TWWalletConnectRequestParse', [coin, input]);

}
