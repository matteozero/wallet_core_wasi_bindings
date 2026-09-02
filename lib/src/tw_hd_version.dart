part of '../../wallet_core_wasi_bindings.dart';

enum TWHDVersion {
  none(0),
  xpub(76067358),
  xprv(76066276),
  ypub(77429938),
  yprv(77428856),
  zpub(78792518),
  zprv(78791436),
  ltub(27108450),
  ltpv(27106558),
  mtub(28471030),
  mtpv(28469138),
  dpub(50178342),
  dprv(50177256),
  dgub(49990397),
  dgpv(49988504),
  ;

  const TWHDVersion(this.value);
  final int value;

  static TWHDVersion fromValue(int value) =>
      TWHDVersion.values.firstWhere((e) => e.value == value);
}
