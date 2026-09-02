part of '../wallet_core_wasi_bindings.dart';

TWStoredKeyInterface get _tWStoredKeyImpl => WalletCoreWasiBindings.backend<TWStoredKeyInterface>();

final Finalizer<int> _tWStoredKeyFinalizer = Finalizer<int>((pointer) {
  _tWStoredKeyImpl.delete(pointer);
});

class TWStoredKey extends TWObjectFinalizable {
  factory TWStoredKey.createLevel(String name, Uint8List password, TWStoredKeyEncryptionLevel encryptionLevel) {
    final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _ptr = _tWStoredKeyImpl.createLevel(_nameStr.pointer, _passwordData.pointer, encryptionLevel.value);
    _nameStr.delete();
    _passwordData.delete();
    return TWStoredKey.fromPointer(_ptr);
  }

  factory TWStoredKey.createLevelAndEncryption(String name, Uint8List password, TWStoredKeyEncryptionLevel encryptionLevel, TWStoredKeyEncryption encryption) {
    final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _ptr = _tWStoredKeyImpl.createLevelAndEncryption(_nameStr.pointer, _passwordData.pointer, encryptionLevel.value, encryption.value);
    _nameStr.delete();
    _passwordData.delete();
    return TWStoredKey.fromPointer(_ptr);
  }

  factory TWStoredKey.create(String name, Uint8List password) {
    final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _ptr = _tWStoredKeyImpl.create(_nameStr.pointer, _passwordData.pointer);
    _nameStr.delete();
    _passwordData.delete();
    return TWStoredKey.fromPointer(_ptr);
  }

  factory TWStoredKey.createEncryption(String name, Uint8List password, TWStoredKeyEncryption encryption) {
    final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _ptr = _tWStoredKeyImpl.createEncryption(_nameStr.pointer, _passwordData.pointer, encryption.value);
    _nameStr.delete();
    _passwordData.delete();
    return TWStoredKey.fromPointer(_ptr);
  }

  TWStoredKey.fromPointer(int pointer) : super(pointer, finalizer: _tWStoredKeyFinalizer);

  static TWStoredKey? load(String path) {
    final _pathStr = TWString(path);

    final _r = _tWStoredKeyImpl.load(_pathStr.pointer);
    _pathStr.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importPrivateKey(Uint8List privateKey, String name, Uint8List password, TWCoinType coin) {
    final _privateKeyData = TWData(privateKey);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importPrivateKey(_privateKeyData.pointer, _nameStr.pointer, _passwordData.pointer, coin.value);
    _privateKeyData.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importPrivateKeyWithEncryption(Uint8List privateKey, String name, Uint8List password, TWCoinType coin, TWStoredKeyEncryption encryption) {
    final _privateKeyData = TWData(privateKey);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importPrivateKeyWithEncryption(_privateKeyData.pointer, _nameStr.pointer, _passwordData.pointer, coin.value, encryption.value);
    _privateKeyData.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importHDWallet(String mnemonic, String name, Uint8List password, TWCoinType coin) {
    final _mnemonicStr = TWString(mnemonic);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importHDWallet(_mnemonicStr.pointer, _nameStr.pointer, _passwordData.pointer, coin.value);
    _mnemonicStr.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importHDWalletWithEncryption(String mnemonic, String name, Uint8List password, TWCoinType coin, TWStoredKeyEncryption encryption) {
    final _mnemonicStr = TWString(mnemonic);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importHDWalletWithEncryption(_mnemonicStr.pointer, _nameStr.pointer, _passwordData.pointer, coin.value, encryption.value);
    _mnemonicStr.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importJSON(Uint8List json) {
    final _jsonData = TWData(json);

    final _r = _tWStoredKeyImpl.importJSON(_jsonData.pointer);
    _jsonData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  TWAccount? account(int index) {
    final _r = _tWStoredKeyImpl.account(pointer, index);
    return ((_r) == 0 ? null : TWAccount.fromPointer(_r));
  }

  TWAccount? accountForCoin(TWCoinType coin, TWHDWallet? wallet) {
    final _r = _tWStoredKeyImpl.accountForCoin(pointer, coin.value, wallet?.pointer ?? 0);
    return ((_r) == 0 ? null : TWAccount.fromPointer(_r));
  }

  TWAccount? accountForCoinDerivation(TWCoinType coin, TWDerivation derivation, TWHDWallet? wallet) {
    final _r = _tWStoredKeyImpl.accountForCoinDerivation(pointer, coin.value, derivation.value, wallet?.pointer ?? 0);
    return ((_r) == 0 ? null : TWAccount.fromPointer(_r));
  }

  void addAccountDerivation(String address, TWCoinType coin, TWDerivation derivation, String derivationPath, String publicKey, String extendedPublicKey) {
    final _addressStr = TWString(address);
final _derivationPathStr = TWString(derivationPath);
final _publicKeyStr = TWString(publicKey);
final _extendedPublicKeyStr = TWString(extendedPublicKey);

    _tWStoredKeyImpl.addAccountDerivation(pointer, _addressStr.pointer, coin.value, derivation.value, _derivationPathStr.pointer, _publicKeyStr.pointer, _extendedPublicKeyStr.pointer);
    _addressStr.delete();
    _derivationPathStr.delete();
    _publicKeyStr.delete();
    _extendedPublicKeyStr.delete();
  }

  void addAccount(String address, TWCoinType coin, String derivationPath, String publicKey, String extendedPublicKey) {
    final _addressStr = TWString(address);
final _derivationPathStr = TWString(derivationPath);
final _publicKeyStr = TWString(publicKey);
final _extendedPublicKeyStr = TWString(extendedPublicKey);

    _tWStoredKeyImpl.addAccount(pointer, _addressStr.pointer, coin.value, _derivationPathStr.pointer, _publicKeyStr.pointer, _extendedPublicKeyStr.pointer);
    _addressStr.delete();
    _derivationPathStr.delete();
    _publicKeyStr.delete();
    _extendedPublicKeyStr.delete();
  }

  void removeAccountForCoin(TWCoinType coin) {
    _tWStoredKeyImpl.removeAccountForCoin(pointer, coin.value);
  }

  void removeAccountForCoinDerivation(TWCoinType coin, TWDerivation derivation) {
    _tWStoredKeyImpl.removeAccountForCoinDerivation(pointer, coin.value, derivation.value);
  }

  void removeAccountForCoinDerivationPath(TWCoinType coin, String derivationPath) {
    final _derivationPathStr = TWString(derivationPath);

    _tWStoredKeyImpl.removeAccountForCoinDerivationPath(pointer, coin.value, _derivationPathStr.pointer);
    _derivationPathStr.delete();
  }

  bool store(String path) {
    final _pathStr = TWString(path);

    final _r = _tWStoredKeyImpl.store(pointer, _pathStr.pointer);
    _pathStr.delete();
    return _r;
  }

  Uint8List? decryptPrivateKey(Uint8List password) {
    final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.decryptPrivateKey(pointer, _passwordData.pointer);
    _passwordData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  String? decryptMnemonic(Uint8List password) {
    final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.decryptMnemonic(pointer, _passwordData.pointer);
    _passwordData.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  TWPrivateKey? privateKey(TWCoinType coin, Uint8List password) {
    final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.privateKey(pointer, coin.value, _passwordData.pointer);
    _passwordData.delete();
    return ((_r) == 0 ? null : TWPrivateKey.fromPointer(_r));
  }

  TWHDWallet? wallet(Uint8List password) {
    final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.wallet(pointer, _passwordData.pointer);
    _passwordData.delete();
    return ((_r) == 0 ? null : TWHDWallet.fromPointer(_r));
  }

  Uint8List? exportJSON() {
    final _r = _tWStoredKeyImpl.exportJSON(pointer);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  bool fixAddresses(Uint8List password) {
    final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.fixAddresses(pointer, _passwordData.pointer);
    _passwordData.delete();
    return _r;
  }

  static TWStoredKey? importPrivateKeyWithEncryptionAndDerivation(Uint8List privateKey, String name, Uint8List password, TWCoinType coin, TWStoredKeyEncryption encryption, TWDerivation derivation) {
    final _privateKeyData = TWData(privateKey);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importPrivateKeyWithEncryptionAndDerivation(_privateKeyData.pointer, _nameStr.pointer, _passwordData.pointer, coin.value, encryption.value, derivation.value);
    _privateKeyData.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importPrivateKeyEncoded(String privateKey, String name, Uint8List password, TWCoinType coin) {
    final _privateKeyStr = TWString(privateKey);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importPrivateKeyEncoded(_privateKeyStr.pointer, _nameStr.pointer, _passwordData.pointer, coin.value);
    _privateKeyStr.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importPrivateKeyEncodedWithEncryption(String privateKey, String name, Uint8List password, TWCoinType coin, TWStoredKeyEncryption encryption) {
    final _privateKeyStr = TWString(privateKey);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importPrivateKeyEncodedWithEncryption(_privateKeyStr.pointer, _nameStr.pointer, _passwordData.pointer, coin.value, encryption.value);
    _privateKeyStr.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  static TWStoredKey? importPrivateKeyEncodedWithEncryptionAndDerivation(String privateKey, String name, Uint8List password, TWCoinType coin, TWStoredKeyEncryption encryption, TWDerivation derivation) {
    final _privateKeyStr = TWString(privateKey);
final _nameStr = TWString(name);
final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.importPrivateKeyEncodedWithEncryptionAndDerivation(_privateKeyStr.pointer, _nameStr.pointer, _passwordData.pointer, coin.value, encryption.value, derivation.value);
    _privateKeyStr.delete();
    _nameStr.delete();
    _passwordData.delete();
    return ((_r) == 0 ? null : TWStoredKey.fromPointer(_r));
  }

  bool storeWithTemporaryFile(String path, String temporaryPath) {
    final _pathStr = TWString(path);
final _temporaryPathStr = TWString(temporaryPath);

    final _r = _tWStoredKeyImpl.storeWithTemporaryFile(pointer, _pathStr.pointer, _temporaryPathStr.pointer);
    _pathStr.delete();
    _temporaryPathStr.delete();
    return _r;
  }

  String? decryptPrivateKeyEncoded(Uint8List password) {
    final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.decryptPrivateKeyEncoded(pointer, _passwordData.pointer);
    _passwordData.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  bool updateAddress(TWCoinType coin) {
    final _r = _tWStoredKeyImpl.updateAddress(pointer, coin.value);
    return _r;
  }

  bool fixEncryption(Uint8List password) {
    final _passwordData = TWData(password);

    final _r = _tWStoredKeyImpl.fixEncryption(pointer, _passwordData.pointer);
    _passwordData.delete();
    return _r;
  }

  String? get identifier {
    final _r = _tWStoredKeyImpl.identifier(pointer);
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  String get name {
    final _r = _tWStoredKeyImpl.name(pointer);
    return TWString.fromPointer(_r).value;
  }

  bool get isMnemonic {
    final _r = _tWStoredKeyImpl.isMnemonic(pointer);
    return _r;
  }

  int get accountCount {
    final _r = _tWStoredKeyImpl.accountCount(pointer);
    return _r;
  }

  String? get encryptionParameters {
    final _r = _tWStoredKeyImpl.encryptionParameters(pointer);
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  bool hasPrivateKeyEncoded(TWStoredKey key) {
    final _r = _tWStoredKeyImpl.hasPrivateKeyEncoded(pointer, key.pointer);
    return _r;
  }

  void delete() => disposeWith(_tWStoredKeyImpl.delete);
}
