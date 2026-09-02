part of '../../wallet_core_wasi_bindings.dart';

enum TWFiroAddressType {
  default_(0),
  exchange(1),
  ;

  const TWFiroAddressType(this.value);
  final int value;

  static TWFiroAddressType fromValue(int value) =>
      TWFiroAddressType.values.firstWhere((e) => e.value == value);
}
