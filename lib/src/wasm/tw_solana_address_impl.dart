part of '../../wallet_core_wasi_bindings.dart';

class TWSolanaAddressImpl extends TWSolanaAddressInterface {
  TWSolanaAddressImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string) => wasm.callInt('TWSolanaAddressCreateWithString', [string]);

  @override
  void delete(int pointer) => wasm.callVoid('TWSolanaAddressDelete', [pointer]);

  @override
  int defaultTokenAddress(int address, int tokenMintAddress) => wasm.callInt('TWSolanaAddressDefaultTokenAddress', [address, tokenMintAddress]);

  @override
  int token2022Address(int address, int tokenMintAddress) => wasm.callInt('TWSolanaAddressToken2022Address', [address, tokenMintAddress]);

  @override
  int description(int pointer) => wasm.callInt('TWSolanaAddressDescription', [pointer]);

}
