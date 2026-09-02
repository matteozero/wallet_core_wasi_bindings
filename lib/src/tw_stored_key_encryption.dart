part of '../../wallet_core_wasi_bindings.dart';

enum TWStoredKeyEncryption {
  aes128Ctr(0),
  aes128Cbc(1),
  aes192Ctr(2),
  aes256Ctr(3),
  ;

  const TWStoredKeyEncryption(this.value);
  final int value;

  static TWStoredKeyEncryption fromValue(int value) =>
      TWStoredKeyEncryption.values.firstWhere((e) => e.value == value);
}
