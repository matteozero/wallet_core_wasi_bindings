part of '../../wallet_core_wasi_bindings.dart';

class TWTONAddressConverterImpl extends TWTONAddressConverterInterface {
  TWTONAddressConverterImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int toBoc(int address) => wasm.callInt('TWTONAddressConverterToBoc', [address]);

  @override
  int fromBoc(int boc) => wasm.callInt('TWTONAddressConverterFromBoc', [boc]);

  @override
  int toUserFriendly(int address, bool bounceable, bool testnet) => wasm.callInt('TWTONAddressConverterToUserFriendly', [address, (bounceable ? 1 : 0), (testnet ? 1 : 0)]);

}
