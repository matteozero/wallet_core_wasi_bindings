part of '../../wallet_core_wasi_bindings.dart';

class TWEthereumImpl extends TWEthereumInterface {
  TWEthereumImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int eip2645GetPath(int ethAddress, int layer, int application, int index) => wasm.callInt('TWEthereumEip2645GetPath', [ethAddress, layer, application, index]);

  @override
  int eip4337GetDeploymentAddress(int factoryAddress, int logicAddress, int ownerAddress) => wasm.callInt('TWEthereumEip4337GetDeploymentAddress', [factoryAddress, logicAddress, ownerAddress]);

  @override
  int addressChecksummed(int address) => wasm.callInt('TWEthereumAddressChecksummed', [address]);

  @override
  int eip1014Create2Address(int from, int salt, int initCodeHash) => wasm.callInt('TWEthereumEip1014Create2Address', [from, salt, initCodeHash]);

  @override
  int eip1967ProxyInitCode(int logicAddress, int data) => wasm.callInt('TWEthereumEip1967ProxyInitCode', [logicAddress, data]);

}
