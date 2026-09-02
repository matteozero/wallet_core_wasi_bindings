part of '../../wallet_core_wasi_bindings.dart';

class TWCardanoImpl extends TWCardanoInterface {
  TWCardanoImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int minAdaAmount(int tokenBundle) => wasm.callInt('TWCardanoMinAdaAmount', [tokenBundle]);

  @override
  int outputMinAdaAmount(int toAddress, int tokenBundle, int coinsPerUtxoByte) => wasm.callInt('TWCardanoOutputMinAdaAmount', [toAddress, tokenBundle, coinsPerUtxoByte]);

  @override
  int getStakingAddress(int baseAddress) => wasm.callInt('TWCardanoGetStakingAddress', [baseAddress]);

  @override
  int getByronAddress(int publicKey) => wasm.callInt('TWCardanoGetByronAddress', [publicKey]);

}
