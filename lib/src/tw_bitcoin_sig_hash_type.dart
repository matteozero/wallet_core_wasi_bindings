part of '../../wallet_core_wasi_bindings.dart';

enum TWBitcoinSigHashType {
  all(1),
  none(2),
  single(3),
  fork(64),
  forkBtg(20288),
  anyoneCanPay(128),
  ;

  const TWBitcoinSigHashType(this.value);
  final int value;

  static TWBitcoinSigHashType fromValue(int value) =>
      TWBitcoinSigHashType.values.firstWhere((e) => e.value == value);
}
