part of '../wallet_core_wasi_bindings.dart';

TWBase32Interface get _tWBase32Impl => WalletCoreWasiBindings.backend<TWBase32Interface>();

class TWBase32 {
  TWBase32._();

  static Uint8List? decodeWithAlphabet(String string, String? alphabet) {
    final _stringStr = TWString(string);
final _alphabetStr = alphabet == null ? null : TWString(alphabet);

    final _r = _tWBase32Impl.decodeWithAlphabet(_stringStr.pointer, _alphabetStr?.pointer ?? 0);
    _stringStr.delete();
    _alphabetStr?.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? decode(String string) {
    final _stringStr = TWString(string);

    final _r = _tWBase32Impl.decode(_stringStr.pointer);
    _stringStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static String encodeWithAlphabet(Uint8List data, String? alphabet) {
    final _dataData = TWData(data);
final _alphabetStr = alphabet == null ? null : TWString(alphabet);

    final _r = _tWBase32Impl.encodeWithAlphabet(_dataData.pointer, _alphabetStr?.pointer ?? 0);
    _dataData.delete();
    _alphabetStr?.delete();
    return TWString.fromPointer(_r).value;
  }

  static String encode(Uint8List data) {
    final _dataData = TWData(data);

    final _r = _tWBase32Impl.encode(_dataData.pointer);
    _dataData.delete();
    return TWString.fromPointer(_r).value;
  }

}
