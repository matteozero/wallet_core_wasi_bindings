part of '../../wallet_core_wasi_bindings.dart';

abstract class TWStarkWareInterface {
  int getStarkKeyFromSignature(int derivationPath, int signature);
}
