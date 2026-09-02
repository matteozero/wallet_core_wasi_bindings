part of '../../wallet_core_wasi_bindings.dart';

abstract class TWHashInterface {
  int sHA1(int data);
  int sHA256(int data);
  int sHA512(int data);
  int sHA512_256(int data);
  int keccak256(int data);
  int keccak512(int data);
  int sHA3_256(int data);
  int sHA3_512(int data);
  int rIPEMD(int data);
  int blake256(int data);
  int blake2b(int data, int size);
  int groestl512(int data);
  int sHA256SHA256(int data);
  int sHA256RIPEMD(int data);
  int sHA3_256RIPEMD(int data);
  int blake256Blake256(int data);
  int blake256RIPEMD(int data);
  int groestl512Groestl512(int data);
  int blake2bPersonal(int data, int personal, int outlen);
}
