part of '../../wallet_core_wasi_bindings.dart';

enum TWCurve {
  secp256k1(0),
  ed25519(1),
  ed25519Blake2bNano(2),
  curve25519(3),
  nist256p1(4),
  ed25519ExtendedCardano(5),
  starkex(6),
  ;

  const TWCurve(this.value);
  final int value;

  static TWCurve fromValue(int value) =>
      TWCurve.values.firstWhere((e) => e.value == value);
}
