part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBizInterface {
  int getEncodedHash(int chainId, int codeAddress, int codeName, int codeVersion, int typeHash, int domainSeparatorHash, int sender, int userOpHash);
  int getSignedHash(int hash, int privateKey);
  int signExecuteWithSignatureCall(int input);
}
