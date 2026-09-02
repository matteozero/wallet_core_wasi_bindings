part of '../../wallet_core_wasi_bindings.dart';

abstract class TWEip7702Interface {
  int signAuthorization(int chainId, int contractAddress, int nonce, int privateKey);
  int getAuthorizationHash(int chainId, int contractAddress, int nonce);
}
