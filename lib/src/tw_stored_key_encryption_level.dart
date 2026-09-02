part of '../../wallet_core_wasi_bindings.dart';

enum TWStoredKeyEncryptionLevel {
  default_(0),
  minimal(1),
  weak(2),
  standard(3),
  ;

  const TWStoredKeyEncryptionLevel(this.value);
  final int value;

  static TWStoredKeyEncryptionLevel fromValue(int value) =>
      TWStoredKeyEncryptionLevel.values.firstWhere((e) => e.value == value);
}
