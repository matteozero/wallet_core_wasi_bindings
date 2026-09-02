part of '../../wallet_core_wasi_bindings.dart';

class TWCryptoBoxImpl extends TWCryptoBoxInterface {
  TWCryptoBoxImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encryptEasy(int mySecret, int otherPubkey, int message) => wasm.callInt('TWCryptoBoxEncryptEasy', [mySecret, otherPubkey, message]);

  @override
  int decryptEasy(int mySecret, int otherPubkey, int encrypted) => wasm.callInt('TWCryptoBoxDecryptEasy', [mySecret, otherPubkey, encrypted]);

}
