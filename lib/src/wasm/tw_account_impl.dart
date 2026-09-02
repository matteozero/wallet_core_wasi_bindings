part of '../../wallet_core_wasi_bindings.dart';

class TWAccountImpl extends TWAccountInterface {
  TWAccountImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create(int address, int coin, int derivation, int derivationPath, int publicKey, int extendedPublicKey) => wasm.callInt('TWAccountCreate', [address, coin, derivation, derivationPath, publicKey, extendedPublicKey]);

  @override
  void delete(int pointer) => wasm.callVoid('TWAccountDelete', [pointer]);

  @override
  int address(int pointer) => wasm.callInt('TWAccountAddress', [pointer]);

  @override
  int coin(int pointer) => wasm.callInt('TWAccountCoin', [pointer]);

  @override
  int derivation(int pointer) => wasm.callInt('TWAccountDerivation', [pointer]);

  @override
  int derivationPath(int pointer) => wasm.callInt('TWAccountDerivationPath', [pointer]);

  @override
  int publicKey(int pointer) => wasm.callInt('TWAccountPublicKey', [pointer]);

  @override
  int extendedPublicKey(int pointer) => wasm.callInt('TWAccountExtendedPublicKey', [pointer]);

}
