part of '../../wallet_core_wasi_bindings.dart';

abstract class TWTONWalletInterface {
  int buildV4R2StateInit(int publicKey, int workchain, int walletId);
  int buildV5R1StateInit(int publicKey, int workchain, int walletId);
}
