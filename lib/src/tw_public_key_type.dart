part of '../../wallet_core_wasi_bindings.dart';

enum TWPublicKeyType {
  secp256k1(0),
  secp256k1Extended(1),
  nist256p1(2),
  nist256p1Extended(3),
  ed25519(4),
  ed25519Blake2b(5),
  curve25519(6),
  ed25519Cardano(7),
  starkex(8),
  ;

  const TWPublicKeyType(this.value);
  final int value;

  static TWPublicKeyType fromValue(int value) =>
      TWPublicKeyType.values.firstWhere((e) => e.value == value);
}
