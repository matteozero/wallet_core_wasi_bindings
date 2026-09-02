part of '../../wallet_core_wasi_bindings.dart';

class TWBase32Impl extends TWBase32Interface {
  TWBase32Impl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int decodeWithAlphabet(int string, int alphabet) => wasm.callInt('TWBase32DecodeWithAlphabet', [string, alphabet]);

  @override
  int decode(int string) => wasm.callInt('TWBase32Decode', [string]);

  @override
  int encodeWithAlphabet(int data, int alphabet) => wasm.callInt('TWBase32EncodeWithAlphabet', [data, alphabet]);

  @override
  int encode(int data) => wasm.callInt('TWBase32Encode', [data]);

}
