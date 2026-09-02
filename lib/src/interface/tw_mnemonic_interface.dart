part of '../../wallet_core_wasi_bindings.dart';

abstract class TWMnemonicInterface {
  bool isValid(int mnemonic);
  bool isValidWord(int word);
  int suggest(int prefix);
}
