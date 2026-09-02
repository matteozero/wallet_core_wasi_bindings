part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBase32Interface {
  int decodeWithAlphabet(int string, int alphabet);
  int decode(int string);
  int encodeWithAlphabet(int data, int alphabet);
  int encode(int data);
}
