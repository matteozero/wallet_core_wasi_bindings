part of '../../wallet_core_wasi_bindings.dart';

enum TWDerivation {
  default_(0),
  custom(1),
  bitcoinSegwit(2),
  bitcoinLegacy(3),
  bitcoinTestnet(4),
  litecoinLegacy(5),
  solanaSolana(6),
  stratisSegwit(7),
  bitcoinTaproot(8),
  pactusMainnet(9),
  pactusTestnet(10),
  ;

  const TWDerivation(this.value);
  final int value;

  static TWDerivation fromValue(int value) =>
      TWDerivation.values.firstWhere((e) => e.value == value);
}
