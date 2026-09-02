part of '../wallet_core_wasi_bindings.dart';

TWEthereumInterface get _tWEthereumImpl => WalletCoreWasiBindings.backend<TWEthereumInterface>();

class TWEthereum {
  TWEthereum._();

  static String eip2645GetPath(String ethAddress, String layer, String application, String index) {
    final _ethAddressStr = TWString(ethAddress);
final _layerStr = TWString(layer);
final _applicationStr = TWString(application);
final _indexStr = TWString(index);

    final _r = _tWEthereumImpl.eip2645GetPath(_ethAddressStr.pointer, _layerStr.pointer, _applicationStr.pointer, _indexStr.pointer);
    _ethAddressStr.delete();
    _layerStr.delete();
    _applicationStr.delete();
    _indexStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String eip4337GetDeploymentAddress(String factoryAddress, String logicAddress, String ownerAddress) {
    final _factoryAddressStr = TWString(factoryAddress);
final _logicAddressStr = TWString(logicAddress);
final _ownerAddressStr = TWString(ownerAddress);

    final _r = _tWEthereumImpl.eip4337GetDeploymentAddress(_factoryAddressStr.pointer, _logicAddressStr.pointer, _ownerAddressStr.pointer);
    _factoryAddressStr.delete();
    _logicAddressStr.delete();
    _ownerAddressStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String? addressChecksummed(String address) {
    final _addressStr = TWString(address);

    final _r = _tWEthereumImpl.addressChecksummed(_addressStr.pointer);
    _addressStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? eip1014Create2Address(String from, Uint8List salt, Uint8List initCodeHash) {
    final _fromStr = TWString(from);
final _saltData = TWData(salt);
final _initCodeHashData = TWData(initCodeHash);

    final _r = _tWEthereumImpl.eip1014Create2Address(_fromStr.pointer, _saltData.pointer, _initCodeHashData.pointer);
    _fromStr.delete();
    _saltData.delete();
    _initCodeHashData.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static Uint8List? eip1967ProxyInitCode(String logicAddress, Uint8List data) {
    final _logicAddressStr = TWString(logicAddress);
final _dataData = TWData(data);

    final _r = _tWEthereumImpl.eip1967ProxyInitCode(_logicAddressStr.pointer, _dataData.pointer);
    _logicAddressStr.delete();
    _dataData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
