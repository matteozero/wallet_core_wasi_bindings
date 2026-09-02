part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBech32Interface {
  int encode(int hrp, int data);
  int decode(int string);
  int encodeM(int hrp, int data);
  int decodeM(int string);
}
