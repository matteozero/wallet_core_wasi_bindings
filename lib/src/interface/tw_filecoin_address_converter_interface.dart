part of '../../wallet_core_wasi_bindings.dart';

abstract class TWFilecoinAddressConverterInterface {
  int convertToEthereum(int filecoinAddress);
  int convertFromEthereum(int ethAddress);
}
