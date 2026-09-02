part of '../wallet_core_wasi_bindings.dart';

TWCardanoInterface get _tWCardanoImpl => WalletCoreWasiBindings.backend<TWCardanoInterface>();

class TWCardano {
  TWCardano._();

  static int minAdaAmount(Uint8List tokenBundle) {
    final _tokenBundleData = TWData(tokenBundle);

    final _r = _tWCardanoImpl.minAdaAmount(_tokenBundleData.pointer);
    _tokenBundleData.delete();
    return _r;
  }

  static int outputMinAdaAmount(String toAddress, Uint8List tokenBundle, int coinsPerUtxoByte) {
    final _toAddressStr = TWString(toAddress);
final _tokenBundleData = TWData(tokenBundle);

    final _r = _tWCardanoImpl.outputMinAdaAmount(_toAddressStr.pointer, _tokenBundleData.pointer, coinsPerUtxoByte);
    _toAddressStr.delete();
    _tokenBundleData.delete();
    return _r;
  }

  static String getStakingAddress(String baseAddress) {
    final _baseAddressStr = TWString(baseAddress);

    final _r = _tWCardanoImpl.getStakingAddress(_baseAddressStr.pointer);
    _baseAddressStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String getByronAddress(TWPublicKey publicKey) {
    final _r = _tWCardanoImpl.getByronAddress(publicKey.pointer);
    return TWString.fromPointer(_r).value;
  }

}
