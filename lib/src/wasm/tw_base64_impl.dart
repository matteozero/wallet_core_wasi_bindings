part of '../../wallet_core_wasi_bindings.dart';

class TWBase64Impl extends TWBase64Interface {
  TWBase64Impl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int decode(int string) => wasm.callInt('TWBase64Decode', [string]);

  @override
  int decodeUrl(int string) => wasm.callInt('TWBase64DecodeUrl', [string]);

  @override
  int encode(int data) => wasm.callInt('TWBase64Encode', [data]);

  @override
  int encodeUrl(int data) => wasm.callInt('TWBase64EncodeUrl', [data]);

}
