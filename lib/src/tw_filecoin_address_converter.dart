part of '../wallet_core_wasi_bindings.dart';

TWFilecoinAddressConverterInterface get _tWFilecoinAddressConverterImpl => WalletCoreWasiBindings.backend<TWFilecoinAddressConverterInterface>();

class TWFilecoinAddressConverter {
  TWFilecoinAddressConverter._();

  static String convertToEthereum(String filecoinAddress) {
    final _filecoinAddressStr = TWString(filecoinAddress);

    final _r = _tWFilecoinAddressConverterImpl.convertToEthereum(_filecoinAddressStr.pointer);
    _filecoinAddressStr.delete();
    return TWString.fromPointer(_r).value;
  }

  static String convertFromEthereum(String ethAddress) {
    final _ethAddressStr = TWString(ethAddress);

    final _r = _tWFilecoinAddressConverterImpl.convertFromEthereum(_ethAddressStr.pointer);
    _ethAddressStr.delete();
    return TWString.fromPointer(_r).value;
  }

}
