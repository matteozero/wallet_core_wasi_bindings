part of '../wallet_core_wasi_bindings.dart';

TWBase58Interface get _tWBase58Impl => WalletCoreWasiBindings.backend<TWBase58Interface>();

class TWBase58 {
  TWBase58._();

  static String encode(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWBase58Impl.encode(_dataData.pointer);
    _dataData.delete();
    return TWString.fromPointer(_r).value;
  }

  static String encodeNoCheck(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWBase58Impl.encodeNoCheck(_dataData.pointer);
    _dataData.delete();
    return TWString.fromPointer(_r).value;
  }

  static Uint8List? decode(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBase58Impl.decode(_stringStr.pointer);
    _stringStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? decodeNoCheck(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBase58Impl.decodeNoCheck(_stringStr.pointer);
    _stringStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
