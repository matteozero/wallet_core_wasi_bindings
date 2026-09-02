part of '../../wallet_core_wasi_bindings.dart';

class TWStoredKeyImpl extends TWStoredKeyInterface {
  TWStoredKeyImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createLevel(int name, int password, int encryptionLevel) => wasm.callInt('TWStoredKeyCreateLevel', [name, password, encryptionLevel]);

  @override
  int createLevelAndEncryption(int name, int password, int encryptionLevel, int encryption) => wasm.callInt('TWStoredKeyCreateLevelAndEncryption', [name, password, encryptionLevel, encryption]);

  @override
  int create(int name, int password) => wasm.callInt('TWStoredKeyCreate', [name, password]);

  @override
  int createEncryption(int name, int password, int encryption) => wasm.callInt('TWStoredKeyCreateEncryption', [name, password, encryption]);

  @override
  void delete(int pointer) => wasm.callVoid('TWStoredKeyDelete', [pointer]);

  @override
  int load(int path) => wasm.callInt('TWStoredKeyLoad', [path]);

  @override
  int importPrivateKey(int privateKey, int name, int password, int coin) => wasm.callInt('TWStoredKeyImportPrivateKey', [privateKey, name, password, coin]);

  @override
  int importPrivateKeyWithEncryption(int privateKey, int name, int password, int coin, int encryption) => wasm.callInt('TWStoredKeyImportPrivateKeyWithEncryption', [privateKey, name, password, coin, encryption]);

  @override
  int importHDWallet(int mnemonic, int name, int password, int coin) => wasm.callInt('TWStoredKeyImportHDWallet', [mnemonic, name, password, coin]);

  @override
  int importHDWalletWithEncryption(int mnemonic, int name, int password, int coin, int encryption) => wasm.callInt('TWStoredKeyImportHDWalletWithEncryption', [mnemonic, name, password, coin, encryption]);

  @override
  int importJSON(int json) => wasm.callInt('TWStoredKeyImportJSON', [json]);

  @override
  int account(int key, int index) => wasm.callInt('TWStoredKeyAccount', [key, index]);

  @override
  int accountForCoin(int key, int coin, int wallet) => wasm.callInt('TWStoredKeyAccountForCoin', [key, coin, wallet]);

  @override
  int accountForCoinDerivation(int key, int coin, int derivation, int wallet) => wasm.callInt('TWStoredKeyAccountForCoinDerivation', [key, coin, derivation, wallet]);

  @override
  void addAccountDerivation(int key, int address, int coin, int derivation, int derivationPath, int publicKey, int extendedPublicKey) => wasm.callVoid('TWStoredKeyAddAccountDerivation', [key, address, coin, derivation, derivationPath, publicKey, extendedPublicKey]);

  @override
  void addAccount(int key, int address, int coin, int derivationPath, int publicKey, int extendedPublicKey) => wasm.callVoid('TWStoredKeyAddAccount', [key, address, coin, derivationPath, publicKey, extendedPublicKey]);

  @override
  void removeAccountForCoin(int key, int coin) => wasm.callVoid('TWStoredKeyRemoveAccountForCoin', [key, coin]);

  @override
  void removeAccountForCoinDerivation(int key, int coin, int derivation) => wasm.callVoid('TWStoredKeyRemoveAccountForCoinDerivation', [key, coin, derivation]);

  @override
  void removeAccountForCoinDerivationPath(int key, int coin, int derivationPath) => wasm.callVoid('TWStoredKeyRemoveAccountForCoinDerivationPath', [key, coin, derivationPath]);

  @override
  bool store(int key, int path) => wasm.callBool('TWStoredKeyStore', [key, path]);

  @override
  int decryptPrivateKey(int key, int password) => wasm.callInt('TWStoredKeyDecryptPrivateKey', [key, password]);

  @override
  int decryptMnemonic(int key, int password) => wasm.callInt('TWStoredKeyDecryptMnemonic', [key, password]);

  @override
  int privateKey(int key, int coin, int password) => wasm.callInt('TWStoredKeyPrivateKey', [key, coin, password]);

  @override
  int wallet(int key, int password) => wasm.callInt('TWStoredKeyWallet', [key, password]);

  @override
  int exportJSON(int key) => wasm.callInt('TWStoredKeyExportJSON', [key]);

  @override
  bool fixAddresses(int key, int password) => wasm.callBool('TWStoredKeyFixAddresses', [key, password]);

  @override
  int importPrivateKeyWithEncryptionAndDerivation(int privateKey, int name, int password, int coin, int encryption, int derivation) => wasm.callInt('TWStoredKeyImportPrivateKeyWithEncryptionAndDerivation', [privateKey, name, password, coin, encryption, derivation]);

  @override
  int importPrivateKeyEncoded(int privateKey, int name, int password, int coin) => wasm.callInt('TWStoredKeyImportPrivateKeyEncoded', [privateKey, name, password, coin]);

  @override
  int importPrivateKeyEncodedWithEncryption(int privateKey, int name, int password, int coin, int encryption) => wasm.callInt('TWStoredKeyImportPrivateKeyEncodedWithEncryption', [privateKey, name, password, coin, encryption]);

  @override
  int importPrivateKeyEncodedWithEncryptionAndDerivation(int privateKey, int name, int password, int coin, int encryption, int derivation) => wasm.callInt('TWStoredKeyImportPrivateKeyEncodedWithEncryptionAndDerivation', [privateKey, name, password, coin, encryption, derivation]);

  @override
  bool storeWithTemporaryFile(int key, int path, int temporaryPath) => wasm.callBool('TWStoredKeyStoreWithTemporaryFile', [key, path, temporaryPath]);

  @override
  int decryptPrivateKeyEncoded(int key, int password) => wasm.callInt('TWStoredKeyDecryptPrivateKeyEncoded', [key, password]);

  @override
  bool updateAddress(int key, int coin) => wasm.callBool('TWStoredKeyUpdateAddress', [key, coin]);

  @override
  bool fixEncryption(int key, int password) => wasm.callBool('TWStoredKeyFixEncryption', [key, password]);

  @override
  int identifier(int pointer) => wasm.callInt('TWStoredKeyIdentifier', [pointer]);

  @override
  int name(int pointer) => wasm.callInt('TWStoredKeyName', [pointer]);

  @override
  bool isMnemonic(int pointer) => wasm.callBool('TWStoredKeyIsMnemonic', [pointer]);

  @override
  int accountCount(int pointer) => wasm.callInt('TWStoredKeyAccountCount', [pointer]);

  @override
  int encryptionParameters(int pointer) => wasm.callInt('TWStoredKeyEncryptionParameters', [pointer]);

  @override
  bool hasPrivateKeyEncoded(int pointer, int key) => wasm.callBool('TWStoredKeyHasPrivateKeyEncoded', [pointer, key]);

}
