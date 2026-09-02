part of '../../wallet_core_wasi_bindings.dart';

class TWPBKDF2Impl extends TWPBKDF2Interface {
  TWPBKDF2Impl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int hmacSha256(int password, int salt, int iterations, int dkLen) => wasm.callInt('TWPBKDF2HmacSha256', [password, salt, iterations, dkLen]);

  @override
  int hmacSha512(int password, int salt, int iterations, int dkLen) => wasm.callInt('TWPBKDF2HmacSha512', [password, salt, iterations, dkLen]);

}
