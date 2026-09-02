part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBizPasskeySessionInterface {
  int encodeRegisterSessionCall(int sessionPasskeyPublicKey, int validUntilTimestamp);
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey);
  int encodePasskeySessionNonce(int nonce);
  int encodeExecuteWithPasskeySessionCall(int input);
  int signExecuteWithSignatureCall(int input);
}
