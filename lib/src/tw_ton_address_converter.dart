part of '../wallet_core_wasi_bindings.dart';

TWTONAddressConverterInterface get _tWTONAddressConverterImpl => WalletCoreWasiBindings.backend<TWTONAddressConverterInterface>();

class TWTONAddressConverter extends TWObjectFinalizable {
  TWTONAddressConverter.fromPointer(int pointer) : super(pointer);

  static String? toBoc(String address) {
    final _addressStr = TWString(address);

    final _r = _tWTONAddressConverterImpl.toBoc(_addressStr.pointer);
    _addressStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? fromBoc(String boc) {
    final _bocStr = TWString(boc);

    final _r = _tWTONAddressConverterImpl.fromBoc(_bocStr.pointer);
    _bocStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  static String? toUserFriendly(String address, bool bounceable, bool testnet) {
    final _addressStr = TWString(address);

    final _r = _tWTONAddressConverterImpl.toUserFriendly(_addressStr.pointer, bounceable, testnet);
    _addressStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

}
