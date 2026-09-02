part of '../wallet_core_wasi_bindings.dart';

TWPBKDF2Interface get _tWPBKDF2Impl => WalletCoreWasiBindings.backend<TWPBKDF2Interface>();

class TWPBKDF2 {
  TWPBKDF2._();

  static Uint8List? hmacSha256(Uint8List password, Uint8List salt, int iterations, int dkLen) {
    final _passwordData = TWData(password);
final _saltData = TWData(salt);

    final _r = _tWPBKDF2Impl.hmacSha256(_passwordData.pointer, _saltData.pointer, iterations, dkLen);
    _passwordData.delete();
    _saltData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? hmacSha512(Uint8List password, Uint8List salt, int iterations, int dkLen) {
    final _passwordData = TWData(password);
final _saltData = TWData(salt);

    final _r = _tWPBKDF2Impl.hmacSha512(_passwordData.pointer, _saltData.pointer, iterations, dkLen);
    _passwordData.delete();
    _saltData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
