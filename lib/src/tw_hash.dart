part of '../wallet_core_wasi_bindings.dart';

TWHashInterface get _tWHashImpl => WalletCoreWasiBindings.backend<TWHashInterface>();

class TWHash {
  TWHash._();

  static Uint8List sHA1(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA1(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA256(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA256(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA512(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA512(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA512_256(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA512_256(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List keccak256(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.keccak256(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List keccak512(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.keccak512(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA3_256(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA3_256(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA3_512(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA3_512(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List rIPEMD(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.rIPEMD(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List blake256(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.blake256(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List blake2b(Uint8List data, int size) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.blake2b(_dataData.pointer, size);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List groestl512(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.groestl512(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA256SHA256(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA256SHA256(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA256RIPEMD(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA256RIPEMD(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List sHA3_256RIPEMD(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.sHA3_256RIPEMD(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List blake256Blake256(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.blake256Blake256(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List blake256RIPEMD(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.blake256RIPEMD(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List groestl512Groestl512(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWHashImpl.groestl512Groestl512(_dataData.pointer);
    _dataData.delete();
    return TWData.fromPointer(_r).bytes;
  }

  static Uint8List blake2bPersonal(Uint8List data, Uint8List personal, int outlen) {
    final _dataData = TWData(data);
final _personalData = TWData(personal);

    final _r = _tWHashImpl.blake2bPersonal(_dataData.pointer, _personalData.pointer, outlen);
    _dataData.delete();
    _personalData.delete();
    return TWData.fromPointer(_r).bytes;
  }

}
