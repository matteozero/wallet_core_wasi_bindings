part of '../../wallet_core_wasi_bindings.dart';

abstract class TWHDWalletInterface {
  int create(int strength, int passphrase);
  int createWithMnemonic(int mnemonic, int passphrase);
  int createWithMnemonicCheck(int mnemonic, int passphrase, bool check);
  int createWithEntropy(int entropy, int passphrase);
  void delete(int pointer);
  int getMasterKey(int wallet, int curve);
  int getKeyForCoin(int wallet, int coin);
  int getAddressForCoin(int wallet, int coin);
  int getAddressDerivation(int wallet, int coin, int derivation);
  int getKey(int wallet, int coin, int derivationPath);
  int getKeyDerivation(int wallet, int coin, int derivation);
  int getKeyByCurve(int wallet, int curve, int derivationPath);
  int getDerivedKey(int wallet, int coin, int account, int change, int address);
  int getExtendedPrivateKey(int wallet, int purpose, int coin, int version);
  int getExtendedPublicKey(int wallet, int purpose, int coin, int version);
  int getExtendedPrivateKeyAccount(int wallet, int purpose, int coin, int derivation, int version, int account);
  int getExtendedPublicKeyAccount(int wallet, int purpose, int coin, int derivation, int version, int account);
  int getExtendedPrivateKeyDerivation(int wallet, int purpose, int coin, int derivation, int version);
  int getExtendedPublicKeyDerivation(int wallet, int purpose, int coin, int derivation, int version);
  int getPublicKeyFromExtended(int extended, int coin, int derivationPath);
  int seed(int pointer);
  int mnemonic(int pointer);
  int entropy(int pointer);
}
