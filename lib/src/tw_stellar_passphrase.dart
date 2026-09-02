part of '../../wallet_core_wasi_bindings.dart';

enum TWStellarPassphrase {
  stellar(0),
  kin(1),
  ;

  const TWStellarPassphrase(this.value);
  final int value;

  static TWStellarPassphrase fromValue(int value) =>
      TWStellarPassphrase.values.firstWhere((e) => e.value == value);
}
