part of '../wallet_core_wasi_bindings.dart';

TWMnemonicInterface get _tWMnemonicImpl => WalletCoreWasiBindings.backend<TWMnemonicInterface>();

class TWMnemonic {
  TWMnemonic._();

  static bool isValid(String mnemonic) {
    final _mnemonicStr = TWString(mnemonic);

    final _r = _tWMnemonicImpl.isValid(_mnemonicStr.pointer);
    _mnemonicStr.delete();
    return _r;
  }

  static bool isValidWord(String word) {
    final _wordStr = TWString(word);

    final _r = _tWMnemonicImpl.isValidWord(_wordStr.pointer);
    _wordStr.delete();
    return _r;
  }

  static String suggest(String prefix) {
    final _prefixStr = TWString(prefix);

    final _r = _tWMnemonicImpl.suggest(_prefixStr.pointer);
    _prefixStr.delete();
    return TWString.fromPointer(_r).value;
  }

}
