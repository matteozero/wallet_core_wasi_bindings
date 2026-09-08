part of '../../wallet_core_wasi_bindings.dart';

/// Backend interface for [TWData], TrustWalletCore's opaque managed byte
/// buffer type. See [TWStringInterface] for why this one (and [TWData]'s)
/// interface takes real Dart values instead of pre-marshaled ints.
abstract class TWDataInterface {
  int createWithBytes(Uint8List bytes);

  int createWithSize(int size);

  int createWithData(int dataPointer);

  /// Returns 0 (null) if [hex] is not valid hex.
  int createWithHexString(String hex);

  int size(int pointer);

  Uint8List bytes(int pointer);

  void setByte(int pointer, int index, int byte);

  /// Returns true on success.
  bool copyBytes(int pointer, int start, int size, Uint8List output);

  /// Returns true on success.
  bool replaceBytes(int pointer, int start, int size, Uint8List bytes);

  void appendBytes(int pointer, Uint8List bytes);

  void appendByte(int pointer, int byte);

  void appendData(int pointer, int otherPointer);

  void reverse(int pointer);

  void reset(int pointer);

  bool equal(int lhsPointer, int rhsPointer);

  void delete(int pointer);
}
