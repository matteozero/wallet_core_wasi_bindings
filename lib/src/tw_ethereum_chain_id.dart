part of '../../wallet_core_wasi_bindings.dart';

enum TWEthereumChainID {
  ethereum(1),
  classic(61),
  poa(99),
  vechain(74),
  callisto(820),
  tomochain(88),
  polygon(137),
  okc(66),
  thundertoken(108),
  gochain(60),
  meter(82),
  celo(42220),
  wanchain(888),
  cronos(25),
  optimism(10),
  xdai(100),
  smartbch(10000),
  fantom(250),
  boba(288),
  kcc(321),
  zksync(324),
  heco(128),
  metis(1088),
  polygonzkevm(1101),
  moonbeam(1284),
  moonriver(1285),
  ronin(2020),
  kavaevm(2222),
  iotexevm(4689),
  kaia(8217),
  avalanchec(43114),
  evmos(9001),
  arbitrum(42161),
  smartchain(56),
  aurora(1313161554),
  ;

  const TWEthereumChainID(this.value);
  final int value;

  static TWEthereumChainID fromValue(int value) =>
      TWEthereumChainID.values.firstWhere((e) => e.value == value);
}
