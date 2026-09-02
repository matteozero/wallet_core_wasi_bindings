part of '../../wallet_core_wasi_bindings.dart';

class TWHDWalletImpl extends TWHDWalletInterface {
  TWHDWalletImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create(int strength, int passphrase) => wasm.callInt('TWHDWalletCreate', [strength, passphrase]);

  @override
  int createWithMnemonic(int mnemonic, int passphrase) => wasm.callInt('TWHDWalletCreateWithMnemonic', [mnemonic, passphrase]);

  @override
  int createWithMnemonicCheck(int mnemonic, int passphrase, bool check) => wasm.callInt('TWHDWalletCreateWithMnemonicCheck', [mnemonic, passphrase, (check ? 1 : 0)]);

  @override
  int createWithEntropy(int entropy, int passphrase) => wasm.callInt('TWHDWalletCreateWithEntropy', [entropy, passphrase]);

  @override
  void delete(int pointer) => wasm.callVoid('TWHDWalletDelete', [pointer]);

  @override
  int getMasterKey(int wallet, int curve) => wasm.callInt('TWHDWalletGetMasterKey', [wallet, curve]);

  @override
  int getKeyForCoin(int wallet, int coin) => wasm.callInt('TWHDWalletGetKeyForCoin', [wallet, coin]);

  @override
  int getAddressForCoin(int wallet, int coin) => wasm.callInt('TWHDWalletGetAddressForCoin', [wallet, coin]);

  @override
  int getAddressDerivation(int wallet, int coin, int derivation) => wasm.callInt('TWHDWalletGetAddressDerivation', [wallet, coin, derivation]);

  @override
  int getKey(int wallet, int coin, int derivationPath) => wasm.callInt('TWHDWalletGetKey', [wallet, coin, derivationPath]);

  @override
  int getKeyDerivation(int wallet, int coin, int derivation) => wasm.callInt('TWHDWalletGetKeyDerivation', [wallet, coin, derivation]);

  @override
  int getKeyByCurve(int wallet, int curve, int derivationPath) => wasm.callInt('TWHDWalletGetKeyByCurve', [wallet, curve, derivationPath]);

  @override
  int getDerivedKey(int wallet, int coin, int account, int change, int address) => wasm.callInt('TWHDWalletGetDerivedKey', [wallet, coin, account, change, address]);

  @override
  int getExtendedPrivateKey(int wallet, int purpose, int coin, int version) => wasm.callInt('TWHDWalletGetExtendedPrivateKey', [wallet, purpose, coin, version]);

  @override
  int getExtendedPublicKey(int wallet, int purpose, int coin, int version) => wasm.callInt('TWHDWalletGetExtendedPublicKey', [wallet, purpose, coin, version]);

  @override
  int getExtendedPrivateKeyAccount(int wallet, int purpose, int coin, int derivation, int version, int account) => wasm.callInt('TWHDWalletGetExtendedPrivateKeyAccount', [wallet, purpose, coin, derivation, version, account]);

  @override
  int getExtendedPublicKeyAccount(int wallet, int purpose, int coin, int derivation, int version, int account) => wasm.callInt('TWHDWalletGetExtendedPublicKeyAccount', [wallet, purpose, coin, derivation, version, account]);

  @override
  int getExtendedPrivateKeyDerivation(int wallet, int purpose, int coin, int derivation, int version) => wasm.callInt('TWHDWalletGetExtendedPrivateKeyDerivation', [wallet, purpose, coin, derivation, version]);

  @override
  int getExtendedPublicKeyDerivation(int wallet, int purpose, int coin, int derivation, int version) => wasm.callInt('TWHDWalletGetExtendedPublicKeyDerivation', [wallet, purpose, coin, derivation, version]);

  @override
  int getPublicKeyFromExtended(int extended, int coin, int derivationPath) => wasm.callInt('TWHDWalletGetPublicKeyFromExtended', [extended, coin, derivationPath]);

  @override
  int seed(int pointer) => wasm.callInt('TWHDWalletSeed', [pointer]);

  @override
  int mnemonic(int pointer) => wasm.callInt('TWHDWalletMnemonic', [pointer]);

  @override
  int entropy(int pointer) => wasm.callInt('TWHDWalletEntropy', [pointer]);

}
