part of '../../wallet_core_wasi_bindings.dart';

enum TWPrivateKeyType {
  default_(0),
  cardano(1),
  ;

  const TWPrivateKeyType(this.value);
  final int value;

  static TWPrivateKeyType fromValue(int value) =>
      TWPrivateKeyType.values.firstWhere((e) => e.value == value);
}
