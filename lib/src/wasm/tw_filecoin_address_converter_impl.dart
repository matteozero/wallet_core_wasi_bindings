part of '../../wallet_core_wasi_bindings.dart';

class TWFilecoinAddressConverterImpl extends TWFilecoinAddressConverterInterface {
  TWFilecoinAddressConverterImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int convertToEthereum(int filecoinAddress) => wasm.callInt('TWFilecoinAddressConverterConvertToEthereum', [filecoinAddress]);

  @override
  int convertFromEthereum(int ethAddress) => wasm.callInt('TWFilecoinAddressConverterConvertFromEthereum', [ethAddress]);

}
