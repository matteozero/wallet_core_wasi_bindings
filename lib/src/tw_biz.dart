part of '../wallet_core_wasi_bindings.dart';

TWBizInterface get _tWBizImpl => WalletCoreWasiBindings.backend<TWBizInterface>();

class TWBiz extends TWObjectFinalizable {
  TWBiz.fromPointer(int pointer) : super(pointer);

  static Uint8List? getEncodedHash(Uint8List chainId, String codeAddress, String codeName, String codeVersion, String typeHash, String domainSeparatorHash, String sender, String userOpHash) {
    final _chainIdData = TWData(chainId);
final _codeAddressStr = TWString(codeAddress);
final _codeNameStr = TWString(codeName);
final _codeVersionStr = TWString(codeVersion);
final _typeHashStr = TWString(typeHash);
final _domainSeparatorHashStr = TWString(domainSeparatorHash);
final _senderStr = TWString(sender);
final _userOpHashStr = TWString(userOpHash);

    final _r = _tWBizImpl.getEncodedHash(_chainIdData.pointer, _codeAddressStr.pointer, _codeNameStr.pointer, _codeVersionStr.pointer, _typeHashStr.pointer, _domainSeparatorHashStr.pointer, _senderStr.pointer, _userOpHashStr.pointer);
    _chainIdData.delete();
    _codeAddressStr.delete();
    _codeNameStr.delete();
    _codeVersionStr.delete();
    _typeHashStr.delete();
    _domainSeparatorHashStr.delete();
    _senderStr.delete();
    _userOpHashStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? getSignedHash(String hash, String privateKey) {
    final _hashStr = TWString(hash);
final _privateKeyStr = TWString(privateKey);

    final _r = _tWBizImpl.getSignedHash(_hashStr.pointer, _privateKeyStr.pointer);
    _hashStr.delete();
    _privateKeyStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? signExecuteWithSignatureCall(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWBizImpl.signExecuteWithSignatureCall(_inputData.pointer);
    _inputData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
