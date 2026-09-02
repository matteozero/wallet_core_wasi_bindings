part of '../wallet_core_wasi_bindings.dart';

TWWebAuthnInterface get _tWWebAuthnImpl => WalletCoreWasiBindings.backend<TWWebAuthnInterface>();

class TWWebAuthn {
  TWWebAuthn._();

  static TWPublicKey? getPublicKey(Uint8List attestationObject) {
    final _attestationObjectData = TWData(attestationObject);

    final _r = _tWWebAuthnImpl.getPublicKey(_attestationObjectData.pointer);
    _attestationObjectData.delete();
    return ((_r) == 0 ? null : TWPublicKey.fromPointer(_r));
  }

  static Uint8List? getRSValues(Uint8List signature) {
    final _signatureData = TWData(signature);

    final _r = _tWWebAuthnImpl.getRSValues(_signatureData.pointer);
    _signatureData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List reconstructOriginalMessage(Uint8List authenticatorData, Uint8List clientDataJSON) {
    final _authenticatorDataData = TWData(authenticatorData);
final _clientDataJSONData = TWData(clientDataJSON);

    final _r = _tWWebAuthnImpl.reconstructOriginalMessage(_authenticatorDataData.pointer, _clientDataJSONData.pointer);
    _authenticatorDataData.delete();
    _clientDataJSONData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
