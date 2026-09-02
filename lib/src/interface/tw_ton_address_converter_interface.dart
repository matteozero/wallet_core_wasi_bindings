part of '../../wallet_core_wasi_bindings.dart';

abstract class TWTONAddressConverterInterface {
  int toBoc(int address);
  int fromBoc(int boc);
  int toUserFriendly(int address, bool bounceable, bool testnet);
}
