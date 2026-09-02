part of '../../wallet_core_wasi_bindings.dart';

abstract class TWPublicKeyInterface {
  int createWithData(int data, int type);
  void delete(int pointer);
  bool isValid(int data, int type);
  bool verify(int pk, int signature, int message);
  bool verifyAsDER(int pk, int signature, int message);
  bool verifyZilliqaSchnorr(int pk, int signature, int message);
  int recover(int signature, int message);
  bool isCompressed(int pointer);
  int compressed(int pointer);
  int uncompressed(int pointer);
  int data(int pointer);
  int keyType(int pointer);
  int description(int pointer);
}
