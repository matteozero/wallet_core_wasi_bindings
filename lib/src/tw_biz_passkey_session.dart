part of '../wallet_core_wasi_bindings.dart';

TWBizPasskeySessionInterface get _tWBizPasskeySessionImpl => WalletCoreWasiBindings.backend<TWBizPasskeySessionInterface>();

class TWBizPasskeySession extends TWObjectFinalizable {
  TWBizPasskeySession.fromPointer(int pointer) : super(pointer);

  static Uint8List? encodeRegisterSessionCall(TWPublicKey sessionPasskeyPublicKey, Uint8List validUntilTimestamp) {
    final _validUntilTimestampData = TWData(validUntilTimestamp);

    final _r = _tWBizPasskeySessionImpl.encodeRegisterSessionCall(sessionPasskeyPublicKey.pointer, _validUntilTimestampData.pointer);
    _validUntilTimestampData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? encodeRemoveSessionCall(TWPublicKey sessionPasskeyPublicKey) {
    final _r = _tWBizPasskeySessionImpl.encodeRemoveSessionCall(sessionPasskeyPublicKey.pointer);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? encodePasskeySessionNonce(Uint8List nonce) {
    final _nonceData = TWData(nonce);

    final _r = _tWBizPasskeySessionImpl.encodePasskeySessionNonce(_nonceData.pointer);
    _nonceData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? encodeExecuteWithPasskeySessionCall(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWBizPasskeySessionImpl.encodeExecuteWithPasskeySessionCall(_inputData.pointer);
    _inputData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? signExecuteWithSignatureCall(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWBizPasskeySessionImpl.signExecuteWithSignatureCall(_inputData.pointer);
    _inputData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
