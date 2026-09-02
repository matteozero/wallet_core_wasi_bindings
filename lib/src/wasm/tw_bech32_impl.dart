part of '../../wallet_core_wasi_bindings.dart';

class TWBech32Impl extends TWBech32Interface {
  TWBech32Impl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int encode(int hrp, int data) => wasm.callInt('TWBech32Encode', [hrp, data]);

  @override
  int decode(int string) => wasm.callInt('TWBech32Decode', [string]);

  @override
  int encodeM(int hrp, int data) => wasm.callInt('TWBech32EncodeM', [hrp, data]);

  @override
  int decodeM(int string) => wasm.callInt('TWBech32DecodeM', [string]);

}
