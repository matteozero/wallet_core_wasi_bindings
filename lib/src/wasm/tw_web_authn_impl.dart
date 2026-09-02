part of '../../wallet_core_wasi_bindings.dart';

class TWWebAuthnImpl extends TWWebAuthnInterface {
  TWWebAuthnImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int getPublicKey(int attestationObject) => wasm.callInt('TWWebAuthnGetPublicKey', [attestationObject]);

  @override
  int getRSValues(int signature) => wasm.callInt('TWWebAuthnGetRSValues', [signature]);

  @override
  int reconstructOriginalMessage(int authenticatorData, int clientDataJSON) => wasm.callInt('TWWebAuthnReconstructOriginalMessage', [authenticatorData, clientDataJSON]);

}
