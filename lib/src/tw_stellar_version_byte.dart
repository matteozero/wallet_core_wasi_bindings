part of '../../wallet_core_wasi_bindings.dart';

enum TWStellarVersionByte {
  accountId(48),
  seed(192),
  preAuthTx(200),
  sha256Hash(280),
  ;

  const TWStellarVersionByte(this.value);
  final int value;

  static TWStellarVersionByte fromValue(int value) =>
      TWStellarVersionByte.values.firstWhere((e) => e.value == value);
}
