part of '../../wallet_core_wasi_bindings.dart';

enum TWStellarMemoType {
  none(0),
  text(1),
  id(2),
  hash(3),
  return_(4),
  ;

  const TWStellarMemoType(this.value);
  final int value;

  static TWStellarMemoType fromValue(int value) =>
      TWStellarMemoType.values.firstWhere((e) => e.value == value);
}
