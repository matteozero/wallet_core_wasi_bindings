part of '../../wallet_core_wasi_bindings.dart';

abstract class TWBitcoinScriptInterface {
  int create();
  int createWithData(int data);
  int createCopy(int script);
  void delete(int pointer);
  bool equal(int lhs, int rhs);
  int matchPayToPubkey(int script);
  int matchPayToPubkeyHash(int script);
  int matchPayToScriptHash(int script);
  int matchPayToWitnessPublicKeyHash(int script);
  int matchPayToWitnessScriptHash(int script);
  int encode(int script);
  int buildPayToPublicKey(int pubkey);
  int buildPayToPublicKeyHash(int hash);
  int buildPayToScriptHash(int scriptHash);
  int buildPayToWitnessPubkeyHash(int hash);
  int buildPayToWitnessScriptHash(int scriptHash);
  int lockScriptForAddress(int address, int coin);
  int hashTypeForCoin(int coinType);
  int lockScriptForAddressReplay(int address, int coin, int blockHash, int blockHeight);
  int createWithBytes(int bytes, int size);
  int size(int pointer);
  int data(int pointer);
  int scriptHash(int pointer);
  bool isPayToScriptHash(int pointer);
  bool isPayToWitnessScriptHash(int pointer);
  bool isPayToWitnessPublicKeyHash(int pointer);
  bool isWitnessProgram(int pointer);
}
