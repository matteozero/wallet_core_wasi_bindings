part of '../wallet_core_wasi_bindings.dart';

TWEip7702Interface get _tWEip7702Impl => WalletCoreWasiBindings.backend<TWEip7702Interface>();

class TWEip7702 extends TWObjectFinalizable {
  TWEip7702.fromPointer(int pointer) : super(pointer);

  static String? signAuthorization(Uint8List chainId, String contractAddress, Uint8List nonce, String privateKey) {
    final _chainIdData = TWData(chainId);
final _contractAddressStr = TWString(contractAddress);
final _nonceData = TWData(nonce);
final _privateKeyStr = TWString(privateKey);

    final _r = _tWEip7702Impl.signAuthorization(_chainIdData.pointer, _contractAddressStr.pointer, _nonceData.pointer, _privateKeyStr.pointer);
    _chainIdData.delete();
    _contractAddressStr.delete();
    _nonceData.delete();
    _privateKeyStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static Uint8List? getAuthorizationHash(Uint8List chainId, String contractAddress, Uint8List nonce) {
    final _chainIdData = TWData(chainId);
final _contractAddressStr = TWString(contractAddress);
final _nonceData = TWData(nonce);

    final _r = _tWEip7702Impl.getAuthorizationHash(_chainIdData.pointer, _contractAddressStr.pointer, _nonceData.pointer);
    _chainIdData.delete();
    _contractAddressStr.delete();
    _nonceData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
