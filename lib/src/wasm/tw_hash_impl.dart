part of '../../wallet_core_wasi_bindings.dart';

class TWHashImpl extends TWHashInterface {
  TWHashImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int sHA1(int data) => wasm.callInt('TWHashSHA1', [data]);

  @override
  int sHA256(int data) => wasm.callInt('TWHashSHA256', [data]);

  @override
  int sHA512(int data) => wasm.callInt('TWHashSHA512', [data]);

  @override
  int sHA512_256(int data) => wasm.callInt('TWHashSHA512_256', [data]);

  @override
  int keccak256(int data) => wasm.callInt('TWHashKeccak256', [data]);

  @override
  int keccak512(int data) => wasm.callInt('TWHashKeccak512', [data]);

  @override
  int sHA3_256(int data) => wasm.callInt('TWHashSHA3_256', [data]);

  @override
  int sHA3_512(int data) => wasm.callInt('TWHashSHA3_512', [data]);

  @override
  int rIPEMD(int data) => wasm.callInt('TWHashRIPEMD', [data]);

  @override
  int blake256(int data) => wasm.callInt('TWHashBlake256', [data]);

  @override
  int blake2b(int data, int size) => wasm.callInt('TWHashBlake2b', [data, size]);

  @override
  int groestl512(int data) => wasm.callInt('TWHashGroestl512', [data]);

  @override
  int sHA256SHA256(int data) => wasm.callInt('TWHashSHA256SHA256', [data]);

  @override
  int sHA256RIPEMD(int data) => wasm.callInt('TWHashSHA256RIPEMD', [data]);

  @override
  int sHA3_256RIPEMD(int data) => wasm.callInt('TWHashSHA3_256RIPEMD', [data]);

  @override
  int blake256Blake256(int data) => wasm.callInt('TWHashBlake256Blake256', [data]);

  @override
  int blake256RIPEMD(int data) => wasm.callInt('TWHashBlake256RIPEMD', [data]);

  @override
  int groestl512Groestl512(int data) => wasm.callInt('TWHashGroestl512Groestl512', [data]);

  @override
  int blake2bPersonal(int data, int personal, int outlen) => wasm.callInt('TWHashBlake2bPersonal', [data, personal, outlen]);

}
