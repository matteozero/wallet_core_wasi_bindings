part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBase58Interface {
  int encode(int data);
  int encodeNoCheck(int data);
  int decode(int string);
  int decodeNoCheck(int string);
}
