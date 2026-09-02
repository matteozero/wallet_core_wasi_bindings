part of '../wallet_core_wasi_bindings.dart';

TWHDWalletInterface get _tWHDWalletImpl => WalletCoreWasiBindings.backend<TWHDWalletInterface>();

final Finalizer<int> _tWHDWalletFinalizer = Finalizer<int>((pointer) {
  _tWHDWalletImpl.delete(pointer);
});

class TWHDWallet extends TWObjectFinalizable {
  factory TWHDWallet.create(int strength, String passphrase) {
    final _passphraseStr = TWString(passphrase);

    final _ptr = _tWHDWalletImpl.create(strength, _passphraseStr.pointer);
    _passphraseStr.delete();
    if (_ptr == 0) throw StateError('TWHDWalletCreate failed');
    return TWHDWallet.fromPointer(_ptr);
  }

  factory TWHDWallet.createWithMnemonic(String mnemonic, String passphrase) {
    final _mnemonicStr = TWString(mnemonic);
final _passphraseStr = TWString(passphrase);

    final _ptr = _tWHDWalletImpl.createWithMnemonic(_mnemonicStr.pointer, _passphraseStr.pointer);
    _mnemonicStr.delete();
    _passphraseStr.delete();
    if (_ptr == 0) throw StateError('TWHDWalletCreateWithMnemonic failed');
    return TWHDWallet.fromPointer(_ptr);
  }

  factory TWHDWallet.createWithMnemonicCheck(String mnemonic, String passphrase, bool check) {
    final _mnemonicStr = TWString(mnemonic);
final _passphraseStr = TWString(passphrase);

    final _ptr = _tWHDWalletImpl.createWithMnemonicCheck(_mnemonicStr.pointer, _passphraseStr.pointer, check);
    _mnemonicStr.delete();
    _passphraseStr.delete();
    if (_ptr == 0) throw StateError('TWHDWalletCreateWithMnemonicCheck failed');
    return TWHDWallet.fromPointer(_ptr);
  }

  factory TWHDWallet.createWithEntropy(Uint8List entropy, String passphrase) {
    final _entropyData = TWData(entropy);
final _passphraseStr = TWString(passphrase);

    final _ptr = _tWHDWalletImpl.createWithEntropy(_entropyData.pointer, _passphraseStr.pointer);
    _entropyData.delete();
    _passphraseStr.delete();
    if (_ptr == 0) throw StateError('TWHDWalletCreateWithEntropy failed');
    return TWHDWallet.fromPointer(_ptr);
  }

  TWHDWallet.fromPointer(int pointer) : super(pointer, finalizer: _tWHDWalletFinalizer);

  TWPrivateKey getMasterKey(TWCurve curve) {
    final _r = _tWHDWalletImpl.getMasterKey(pointer, curve.value);
    return TWPrivateKey.fromPointer(_r);
  }

  TWPrivateKey getKeyForCoin(TWCoinType coin) {
    final _r = _tWHDWalletImpl.getKeyForCoin(pointer, coin.value);
    return TWPrivateKey.fromPointer(_r);
  }

  String getAddressForCoin(TWCoinType coin) {
    final _r = _tWHDWalletImpl.getAddressForCoin(pointer, coin.value);
    return TWString.fromPointer(_r).value;
  }

  String getAddressDerivation(TWCoinType coin, TWDerivation derivation) {
    final _r = _tWHDWalletImpl.getAddressDerivation(pointer, coin.value, derivation.value);
    return TWString.fromPointer(_r).value;
  }

  TWPrivateKey getKey(TWCoinType coin, String derivationPath) {
    final _derivationPathStr = TWString(derivationPath);

    final _r = _tWHDWalletImpl.getKey(pointer, coin.value, _derivationPathStr.pointer);
    _derivationPathStr.delete();
    return TWPrivateKey.fromPointer(_r);
  }

  TWPrivateKey getKeyDerivation(TWCoinType coin, TWDerivation derivation) {
    final _r = _tWHDWalletImpl.getKeyDerivation(pointer, coin.value, derivation.value);
    return TWPrivateKey.fromPointer(_r);
  }

  TWPrivateKey getKeyByCurve(TWCurve curve, String derivationPath) {
    final _derivationPathStr = TWString(derivationPath);

    final _r = _tWHDWalletImpl.getKeyByCurve(pointer, curve.value, _derivationPathStr.pointer);
    _derivationPathStr.delete();
    return TWPrivateKey.fromPointer(_r);
  }

  TWPrivateKey getDerivedKey(TWCoinType coin, int account, int change, int address) {
    final _r = _tWHDWalletImpl.getDerivedKey(pointer, coin.value, account, change, address);
    return TWPrivateKey.fromPointer(_r);
  }

  String getExtendedPrivateKey(TWPurpose purpose, TWCoinType coin, TWHDVersion version) {
    final _r = _tWHDWalletImpl.getExtendedPrivateKey(pointer, purpose.value, coin.value, version.value);
    return TWString.fromPointer(_r).value;
  }

  String getExtendedPublicKey(TWPurpose purpose, TWCoinType coin, TWHDVersion version) {
    final _r = _tWHDWalletImpl.getExtendedPublicKey(pointer, purpose.value, coin.value, version.value);
    return TWString.fromPointer(_r).value;
  }

  String getExtendedPrivateKeyAccount(TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version, int account) {
    final _r = _tWHDWalletImpl.getExtendedPrivateKeyAccount(pointer, purpose.value, coin.value, derivation.value, version.value, account);
    return TWString.fromPointer(_r).value;
  }

  String getExtendedPublicKeyAccount(TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version, int account) {
    final _r = _tWHDWalletImpl.getExtendedPublicKeyAccount(pointer, purpose.value, coin.value, derivation.value, version.value, account);
    return TWString.fromPointer(_r).value;
  }

  String getExtendedPrivateKeyDerivation(TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version) {
    final _r = _tWHDWalletImpl.getExtendedPrivateKeyDerivation(pointer, purpose.value, coin.value, derivation.value, version.value);
    return TWString.fromPointer(_r).value;
  }

  String getExtendedPublicKeyDerivation(TWPurpose purpose, TWCoinType coin, TWDerivation derivation, TWHDVersion version) {
    final _r = _tWHDWalletImpl.getExtendedPublicKeyDerivation(pointer, purpose.value, coin.value, derivation.value, version.value);
    return TWString.fromPointer(_r).value;
  }

  static TWPublicKey? getPublicKeyFromExtended(String extended, TWCoinType coin, String derivationPath) {
    final _extendedStr = TWString(extended);
final _derivationPathStr = TWString(derivationPath);

    final _r = _tWHDWalletImpl.getPublicKeyFromExtended(_extendedStr.pointer, coin.value, _derivationPathStr.pointer);
    _extendedStr.delete();
    _derivationPathStr.delete();
    return ((_r) == 0 ? null : TWPublicKey.fromPointer(_r));
  }

  Uint8List get seed {
    final _r = _tWHDWalletImpl.seed(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  String get mnemonic {
    final _r = _tWHDWalletImpl.mnemonic(pointer);
    return TWString.fromPointer(_r).value;
  }

  Uint8List get entropy {
    final _r = _tWHDWalletImpl.entropy(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  void delete() => disposeWith(_tWHDWalletImpl.delete);
}
