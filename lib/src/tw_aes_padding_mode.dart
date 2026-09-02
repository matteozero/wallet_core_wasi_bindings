part of '../../wallet_core_wasi_bindings.dart';

enum TWAESPaddingMode {
  zero(0),
  pkcs7(1),
  ;

  const TWAESPaddingMode(this.value);
  final int value;

  static TWAESPaddingMode fromValue(int value) =>
      TWAESPaddingMode.values.firstWhere((e) => e.value == value);
}
