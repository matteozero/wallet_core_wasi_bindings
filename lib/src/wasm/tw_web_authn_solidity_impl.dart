part of '../../wallet_core_wasi_bindings.dart';

class TWWebAuthnSolidityImpl extends TWWebAuthnSolidityInterface {
  TWWebAuthnSolidityImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int getMessageHash(int authenticatorData, int clientDataJson) => wasm.callInt('TWWebAuthnSolidityGetMessageHash', [authenticatorData, clientDataJson]);

  @override
  int getFormattedSignature(int authenticatorData, int clientDataJson, int derSignature) => wasm.callInt('TWWebAuthnSolidityGetFormattedSignature', [authenticatorData, clientDataJson, derSignature]);

}
