part of '../../wallet_core_wasi_bindings.dart';

enum TWSS58AddressType {
  polkadot(0),
  kusama(2),
  ;

  const TWSS58AddressType(this.value);
  final int value;

  static TWSS58AddressType fromValue(int value) =>
      TWSS58AddressType.values.firstWhere((e) => e.value == value);
}
