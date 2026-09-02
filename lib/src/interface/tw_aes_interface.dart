part of '../../wallet_core_wasi_bindings.dart';

abstract class TWAESInterface {
  int encryptCBC(int key, int data, int iv, int mode);
  int decryptCBC(int key, int data, int iv, int mode);
  int encryptCTR(int key, int data, int iv);
  int decryptCTR(int key, int data, int iv);
}
