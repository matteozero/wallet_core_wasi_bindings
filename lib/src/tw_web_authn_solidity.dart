part of '../wallet_core_wasi_bindings.dart';

TWWebAuthnSolidityInterface get _tWWebAuthnSolidityImpl => WalletCoreWasiBindings.backend<TWWebAuthnSolidityInterface>();

class TWWebAuthnSolidity extends TWObjectFinalizable {
  TWWebAuthnSolidity.fromPointer(int pointer) : super(pointer);

  static Uint8List? getMessageHash(String authenticatorData, String clientDataJson) {
    final _authenticatorDataStr = TWString(authenticatorData);
final _clientDataJsonStr = TWString(clientDataJson);

    final _r = _tWWebAuthnSolidityImpl.getMessageHash(_authenticatorDataStr.pointer, _clientDataJsonStr.pointer);
    _authenticatorDataStr.delete();
    _clientDataJsonStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? getFormattedSignature(String authenticatorData, String clientDataJson, Uint8List derSignature) {
    final _authenticatorDataStr = TWString(authenticatorData);
final _clientDataJsonStr = TWString(clientDataJson);
final _derSignatureData = TWData(derSignature);

    final _r = _tWWebAuthnSolidityImpl.getFormattedSignature(_authenticatorDataStr.pointer, _clientDataJsonStr.pointer, _derSignatureData.pointer);
    _authenticatorDataStr.delete();
    _clientDataJsonStr.delete();
    _derSignatureData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
