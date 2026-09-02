part of '../../wallet_core_wasi_bindings.dart';

abstract class TWEthereumInterface {
  int eip2645GetPath(int ethAddress, int layer, int application, int index);
  int eip4337GetDeploymentAddress(int factoryAddress, int logicAddress, int ownerAddress);
  int addressChecksummed(int address);
  int eip1014Create2Address(int from, int salt, int initCodeHash);
  int eip1967ProxyInitCode(int logicAddress, int data);
}
