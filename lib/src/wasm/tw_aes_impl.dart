part of '../../wallet_core_wasi_bindings.dart';

class TWAESImpl extends TWAESInterface {
  TWAESImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encryptCBC(int key, int data, int iv, int mode) => wasm.callInt('TWAESEncryptCBC', [key, data, iv, mode]);

  @override
  int decryptCBC(int key, int data, int iv, int mode) => wasm.callInt('TWAESDecryptCBC', [key, data, iv, mode]);

  @override
  int encryptCTR(int key, int data, int iv) => wasm.callInt('TWAESEncryptCTR', [key, data, iv]);

  @override
  int decryptCTR(int key, int data, int iv) => wasm.callInt('TWAESDecryptCTR', [key, data, iv]);

}
