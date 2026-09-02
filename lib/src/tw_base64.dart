part of '../wallet_core_wasi_bindings.dart';

TWBase64Interface get _tWBase64Impl => WalletCoreWasiBindings.backend<TWBase64Interface>();

class TWBase64 {
  TWBase64._();

  static Uint8List? decode(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBase64Impl.decode(_stringStr.pointer);
    _stringStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? decodeUrl(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBase64Impl.decodeUrl(_stringStr.pointer);
    _stringStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static String encode(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWBase64Impl.encode(_dataData.pointer);
    _dataData.delete();
    return TWString.fromPointer(_r).value;
  }

  static String encodeUrl(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWBase64Impl.encodeUrl(_dataData.pointer);
    _dataData.delete();
    return TWString.fromPointer(_r).value;
  }

}
