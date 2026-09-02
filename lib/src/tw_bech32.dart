part of '../wallet_core_wasi_bindings.dart';

TWBech32Interface get _tWBech32Impl => WalletCoreWasiBindings.backend<TWBech32Interface>();

class TWBech32 {
  TWBech32._();

  static String encode(String hrp, Uint8List data) {
    final _hrpStr = TWString(hrp);
final _dataData = TWData(data);

    final _r = _tWBech32Impl.encode(_hrpStr.pointer, _dataData.pointer);
    _hrpStr.delete();
    _dataData.delete();
    return TWString.fromPointer(_r).value;
  }

  static Uint8List? decode(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBech32Impl.decode(_stringStr.pointer);
    _stringStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static String encodeM(String hrp, Uint8List data) {
    final _hrpStr = TWString(hrp);
final _dataData = TWData(data);

    final _r = _tWBech32Impl.encodeM(_hrpStr.pointer, _dataData.pointer);
    _hrpStr.delete();
    _dataData.delete();
    return TWString.fromPointer(_r).value;
  }

  static Uint8List? decodeM(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBech32Impl.decodeM(_stringStr.pointer);
    _stringStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
