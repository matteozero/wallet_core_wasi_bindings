part of '../../wallet_core_wasi_bindings.dart';

enum TWFilecoinAddressType {
  default_(0),
  delegated(1),
  ;

  const TWFilecoinAddressType(this.value);
  final int value;

  static TWFilecoinAddressType fromValue(int value) =>
      TWFilecoinAddressType.values.firstWhere((e) => e.value == value);
}
