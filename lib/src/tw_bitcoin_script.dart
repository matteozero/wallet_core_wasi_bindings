part of '../wallet_core_wasi_bindings.dart';

TWBitcoinScriptInterface get _tWBitcoinScriptImpl => WalletCoreWasiBindings.backend<TWBitcoinScriptInterface>();

final Finalizer<int> _tWBitcoinScriptFinalizer = Finalizer<int>((pointer) {
  _tWBitcoinScriptImpl.delete(pointer);
});

class TWBitcoinScript extends TWObjectFinalizable {
  factory TWBitcoinScript.create() {
    final _ptr = _tWBitcoinScriptImpl.create();
    return TWBitcoinScript.fromPointer(_ptr);
  }

  factory TWBitcoinScript.createWithData(Uint8List data) {
    final _dataData = TWData(data);

    final _ptr = _tWBitcoinScriptImpl.createWithData(_dataData.pointer);
    _dataData.delete();
    return TWBitcoinScript.fromPointer(_ptr);
  }

  factory TWBitcoinScript.createCopy(TWBitcoinScript script) {
    final _ptr = _tWBitcoinScriptImpl.createCopy(script.pointer);
    return TWBitcoinScript.fromPointer(_ptr);
  }

  TWBitcoinScript.fromPointer(int pointer) : super(pointer, finalizer: _tWBitcoinScriptFinalizer);

  static bool equal(TWBitcoinScript lhs, TWBitcoinScript rhs) {
    final _r = _tWBitcoinScriptImpl.equal(lhs.pointer, rhs.pointer);
    return _r;
  }

  Uint8List? matchPayToPubkey() {
    final _r = _tWBitcoinScriptImpl.matchPayToPubkey(pointer);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List? matchPayToPubkeyHash() {
    final _r = _tWBitcoinScriptImpl.matchPayToPubkeyHash(pointer);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List? matchPayToScriptHash() {
    final _r = _tWBitcoinScriptImpl.matchPayToScriptHash(pointer);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List? matchPayToWitnessPublicKeyHash() {
    final _r = _tWBitcoinScriptImpl.matchPayToWitnessPublicKeyHash(pointer);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List? matchPayToWitnessScriptHash() {
    final _r = _tWBitcoinScriptImpl.matchPayToWitnessScriptHash(pointer);
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  Uint8List encode() {
    final _r = _tWBitcoinScriptImpl.encode(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  static TWBitcoinScript buildPayToPublicKey(Uint8List pubkey) {
    final _pubkeyData = TWData(pubkey);

    final _r = _tWBitcoinScriptImpl.buildPayToPublicKey(_pubkeyData.pointer);
    _pubkeyData.delete();
    return TWBitcoinScript.fromPointer(_r);
  }

  static TWBitcoinScript buildPayToPublicKeyHash(Uint8List hash) {
    final _hashData = TWData(hash);

    final _r = _tWBitcoinScriptImpl.buildPayToPublicKeyHash(_hashData.pointer);
    _hashData.delete();
    return TWBitcoinScript.fromPointer(_r);
  }

  static TWBitcoinScript buildPayToScriptHash(Uint8List scriptHash) {
    final _scriptHashData = TWData(scriptHash);

    final _r = _tWBitcoinScriptImpl.buildPayToScriptHash(_scriptHashData.pointer);
    _scriptHashData.delete();
    return TWBitcoinScript.fromPointer(_r);
  }

  static TWBitcoinScript buildPayToWitnessPubkeyHash(Uint8List hash) {
    final _hashData = TWData(hash);

    final _r = _tWBitcoinScriptImpl.buildPayToWitnessPubkeyHash(_hashData.pointer);
    _hashData.delete();
    return TWBitcoinScript.fromPointer(_r);
  }

  static TWBitcoinScript buildPayToWitnessScriptHash(Uint8List scriptHash) {
    final _scriptHashData = TWData(scriptHash);

    final _r = _tWBitcoinScriptImpl.buildPayToWitnessScriptHash(_scriptHashData.pointer);
    _scriptHashData.delete();
    return TWBitcoinScript.fromPointer(_r);
  }

  static TWBitcoinScript lockScriptForAddress(String address, TWCoinType coin) {
    final _addressStr = TWString(address);

    final _r = _tWBitcoinScriptImpl.lockScriptForAddress(_addressStr.pointer, coin.value);
    _addressStr.delete();
    return TWBitcoinScript.fromPointer(_r);
  }

  static int hashTypeForCoin(TWCoinType coinType) {
    final _r = _tWBitcoinScriptImpl.hashTypeForCoin(coinType.value);
    return _r;
  }

  static TWBitcoinScript lockScriptForAddressReplay(String address, TWCoinType coin, Uint8List blockHash, int blockHeight) {
    final _addressStr = TWString(address);
final _blockHashData = TWData(blockHash);

    final _r = _tWBitcoinScriptImpl.lockScriptForAddressReplay(_addressStr.pointer, coin.value, _blockHashData.pointer, blockHeight);
    _addressStr.delete();
    _blockHashData.delete();
    return TWBitcoinScript.fromPointer(_r);
  }

  static TWBitcoinScript createWithBytes(int bytes, int size) {
    final _r = _tWBitcoinScriptImpl.createWithBytes(bytes, size);
    return TWBitcoinScript.fromPointer(_r);
  }

  int get size {
    final _r = _tWBitcoinScriptImpl.size(pointer);
    return _r;
  }

  Uint8List get data {
    final _r = _tWBitcoinScriptImpl.data(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  Uint8List get scriptHash {
    final _r = _tWBitcoinScriptImpl.scriptHash(pointer);
    return TWData.fromPointer(_r).bytes;
  }

  bool get isPayToScriptHash {
    final _r = _tWBitcoinScriptImpl.isPayToScriptHash(pointer);
    return _r;
  }

  bool get isPayToWitnessScriptHash {
    final _r = _tWBitcoinScriptImpl.isPayToWitnessScriptHash(pointer);
    return _r;
  }

  bool get isPayToWitnessPublicKeyHash {
    final _r = _tWBitcoinScriptImpl.isPayToWitnessPublicKeyHash(pointer);
    return _r;
  }

  bool get isWitnessProgram {
    final _r = _tWBitcoinScriptImpl.isWitnessProgram(pointer);
    return _r;
  }

  void delete() => disposeWith(_tWBitcoinScriptImpl.delete);
}
