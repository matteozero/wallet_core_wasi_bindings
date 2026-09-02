part of '../../wallet_core_wasi_bindings.dart';

abstract class TWPBKDF2Interface {
  int hmacSha256(int password, int salt, int iterations, int dkLen);
  int hmacSha512(int password, int salt, int iterations, int dkLen);
}
