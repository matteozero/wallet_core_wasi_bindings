part of '../../wallet_core_wasi_bindings.dart';

enum TWPurpose {
  bip44(44),
  bip49(49),
  bip84(84),
  bip1852(1852),
  ;

  const TWPurpose(this.value);
  final int value;

  static TWPurpose fromValue(int value) =>
      TWPurpose.values.firstWhere((e) => e.value == value);
}
