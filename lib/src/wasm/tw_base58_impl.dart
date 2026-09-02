part of '../../wallet_core_wasi_bindings.dart';

class TWBase58Impl extends TWBase58Interface {
  TWBase58Impl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encode(int data) => wasm.callInt('TWBase58Encode', [data]);

  @override
  int encodeNoCheck(int data) => wasm.callInt('TWBase58EncodeNoCheck', [data]);

  @override
  int decode(int string) => wasm.callInt('TWBase58Decode', [string]);

  @override
  int decodeNoCheck(int string) => wasm.callInt('TWBase58DecodeNoCheck', [string]);

}
