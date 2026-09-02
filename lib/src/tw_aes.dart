part of '../wallet_core_wasi_bindings.dart';

TWAESInterface get _tWAESImpl => WalletCoreWasiBindings.backend<TWAESInterface>();

class TWAES {
  TWAES._();

  static Uint8List? encryptCBC(Uint8List key, Uint8List data, Uint8List iv, TWAESPaddingMode mode) {
    final _keyData = TWData(key);
final _dataData = TWData(data);
final _ivData = TWData(iv);

    final _r = _tWAESImpl.encryptCBC(_keyData.pointer, _dataData.pointer, _ivData.pointer, mode.value);
    _keyData.delete();
    _dataData.delete();
    _ivData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? decryptCBC(Uint8List key, Uint8List data, Uint8List iv, TWAESPaddingMode mode) {
    final _keyData = TWData(key);
final _dataData = TWData(data);
final _ivData = TWData(iv);

    final _r = _tWAESImpl.decryptCBC(_keyData.pointer, _dataData.pointer, _ivData.pointer, mode.value);
    _keyData.delete();
    _dataData.delete();
    _ivData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? encryptCTR(Uint8List key, Uint8List data, Uint8List iv) {
    final _keyData = TWData(key);
final _dataData = TWData(data);
final _ivData = TWData(iv);

    final _r = _tWAESImpl.encryptCTR(_keyData.pointer, _dataData.pointer, _ivData.pointer);
    _keyData.delete();
    _dataData.delete();
    _ivData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? decryptCTR(Uint8List key, Uint8List data, Uint8List iv) {
    final _keyData = TWData(key);
final _dataData = TWData(data);
final _ivData = TWData(iv);

    final _r = _tWAESImpl.decryptCTR(_keyData.pointer, _dataData.pointer, _ivData.pointer);
    _keyData.delete();
    _dataData.delete();
    _ivData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
