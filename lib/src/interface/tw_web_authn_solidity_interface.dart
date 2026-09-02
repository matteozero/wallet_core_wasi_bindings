part of '../../wallet_core_wasi_bindings.dart';

abstract class TWWebAuthnSolidityInterface {
  int getMessageHash(int authenticatorData, int clientDataJson);
  int getFormattedSignature(int authenticatorData, int clientDataJson, int derSignature);
}
