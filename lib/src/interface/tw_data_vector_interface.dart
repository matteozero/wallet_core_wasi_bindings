part of '../../wallet_core_wasi_bindings.dart';

abstract class TWDataVectorInterface {
  int create();
  int createWithData(int data);
  void delete(int pointer);
  void add(int dataVector, int data);
  int get_(int dataVector, int index);
  int size(int pointer);
}
