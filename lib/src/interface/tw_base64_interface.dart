part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBase64Interface {
  int decode(int string);
  int decodeUrl(int string);
  int encode(int data);
  int encodeUrl(int data);
}
