part of '../../wallet_core_wasi_bindings.dart';

class TWBitcoinScriptImpl extends TWBitcoinScriptInterface {
  TWBitcoinScriptImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int create() => wasm.callInt('TWBitcoinScriptCreate', []);

  @override
  int createWithData(int data) => wasm.callInt('TWBitcoinScriptCreateWithData', [data]);

  @override
  int createCopy(int script) => wasm.callInt('TWBitcoinScriptCreateCopy', [script]);

  @override
  void delete(int pointer) => wasm.callVoid('TWBitcoinScriptDelete', [pointer]);

  @override
  bool equal(int lhs, int rhs) => wasm.callBool('TWBitcoinScriptEqual', [lhs, rhs]);

  @override
  int matchPayToPubkey(int script) => wasm.callInt('TWBitcoinScriptMatchPayToPubkey', [script]);

  @override
  int matchPayToPubkeyHash(int script) => wasm.callInt('TWBitcoinScriptMatchPayToPubkeyHash', [script]);

  @override
  int matchPayToScriptHash(int script) => wasm.callInt('TWBitcoinScriptMatchPayToScriptHash', [script]);

  @override
  int matchPayToWitnessPublicKeyHash(int script) => wasm.callInt('TWBitcoinScriptMatchPayToWitnessPublicKeyHash', [script]);

  @override
  int matchPayToWitnessScriptHash(int script) => wasm.callInt('TWBitcoinScriptMatchPayToWitnessScriptHash', [script]);

  @override
  int encode(int script) => wasm.callInt('TWBitcoinScriptEncode', [script]);

  @override
  int buildPayToPublicKey(int pubkey) => wasm.callInt('TWBitcoinScriptBuildPayToPublicKey', [pubkey]);

  @override
  int buildPayToPublicKeyHash(int hash) => wasm.callInt('TWBitcoinScriptBuildPayToPublicKeyHash', [hash]);

  @override
  int buildPayToScriptHash(int scriptHash) => wasm.callInt('TWBitcoinScriptBuildPayToScriptHash', [scriptHash]);

  @override
  int buildPayToWitnessPubkeyHash(int hash) => wasm.callInt('TWBitcoinScriptBuildPayToWitnessPubkeyHash', [hash]);

  @override
  int buildPayToWitnessScriptHash(int scriptHash) => wasm.callInt('TWBitcoinScriptBuildPayToWitnessScriptHash', [scriptHash]);

  @override
  int lockScriptForAddress(int address, int coin) => wasm.callInt('TWBitcoinScriptLockScriptForAddress', [address, coin]);

  @override
  int hashTypeForCoin(int coinType) => wasm.callInt('TWBitcoinScriptHashTypeForCoin', [coinType]);

  @override
  int lockScriptForAddressReplay(int address, int coin, int blockHash, int blockHeight) => wasm.callInt('TWBitcoinScriptLockScriptForAddressReplay', [address, coin, blockHash, blockHeight]);

  @override
  int createWithBytes(int bytes, int size) => wasm.callInt('TWBitcoinScriptCreateWithBytes', [bytes, size]);

  @override
  int size(int pointer) => wasm.callInt('TWBitcoinScriptSize', [pointer]);

  @override
  int data(int pointer) => wasm.callInt('TWBitcoinScriptData', [pointer]);

  @override
  int scriptHash(int pointer) => wasm.callInt('TWBitcoinScriptScriptHash', [pointer]);

  @override
  bool isPayToScriptHash(int pointer) => wasm.callBool('TWBitcoinScriptIsPayToScriptHash', [pointer]);

  @override
  bool isPayToWitnessScriptHash(int pointer) => wasm.callBool('TWBitcoinScriptIsPayToWitnessScriptHash', [pointer]);

  @override
  bool isPayToWitnessPublicKeyHash(int pointer) => wasm.callBool('TWBitcoinScriptIsPayToWitnessPublicKeyHash', [pointer]);

  @override
  bool isWitnessProgram(int pointer) => wasm.callBool('TWBitcoinScriptIsWitnessProgram', [pointer]);

}
