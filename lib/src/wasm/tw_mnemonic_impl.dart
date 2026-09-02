part of '../../wallet_core_wasi_bindings.dart';

class TWMnemonicImpl extends TWMnemonicInterface {
  TWMnemonicImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  bool isValid(int mnemonic) => wasm.callBool('TWMnemonicIsValid', [mnemonic]);

  @override
  bool isValidWord(int word) => wasm.callBool('TWMnemonicIsValidWord', [word]);

  @override
  int suggest(int prefix) => wasm.callInt('TWMnemonicSuggest', [prefix]);

}
