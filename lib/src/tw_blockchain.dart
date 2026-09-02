part of '../../wallet_core_wasi_bindings.dart';

enum TWBlockchain {
  bitcoin(0),
  ethereum(1),
  vechain(3),
  tron(4),
  icon(5),
  binance(6),
  ripple(7),
  tezos(8),
  nimiq(9),
  stellar(10),
  aion(11),
  cosmos(12),
  theta(13),
  ontology(14),
  zilliqa(15),
  ioTeX(16),
  eos(17),
  nano(18),
  nuls(19),
  waves(20),
  aeternity(21),
  nebulas(22),
  fio(23),
  solana(24),
  harmony(25),
  near(26),
  algorand(27),
  polkadot(29),
  cardano(30),
  neo(31),
  filecoin(32),
  multiversX(33),
  oasisNetwork(34),
  decred(35),
  zcash(36),
  groestlcoin(37),
  thorchain(38),
  ronin(39),
  kusama(40),
  nervos(41),
  everscale(42),
  aptos(43),
  hedera(44),
  theOpenNetwork(45),
  sui(46),
  ;

  const TWBlockchain(this.value);
  final int value;

  static TWBlockchain fromValue(int value) =>
      TWBlockchain.values.firstWhere((e) => e.value == value);
}
