part of '../../wallet_core_wasi_bindings.dart';

/// Backend interface for [TWString], TrustWalletCore's opaque managed string
/// type. Unlike every other interface in this package, marshaling a Dart
/// [String] into wasm linear memory requires direct access to that memory
/// (malloc/write), so -- uniquely -- this interface's `create*` methods take
/// real Dart values rather than pre-marshaled ints. Every other generated
/// class builds on top of this one instead of touching wasm memory itself.
abstract class TWStringInterface {
  /// Creates a `TWString*` from a Dart string, returning its pointer.
  int create(String value);

  /// Creates a `TWString*` from raw bytes (no assumption of UTF-8), returning
  /// its pointer.
  int createWithRawBytes(Uint8List bytes);

  /// Creates a `TWString*` from a hex-encoded string (`TWData* data` param).
  int createWithHexData(int dataPointer);

  int size(int pointer);

  int byteAt(int pointer, int index);

  /// Decodes the string's UTF-8 bytes back into a Dart [String].
  String utf8Bytes(int pointer);

  bool equal(int lhsPointer, int rhsPointer);

  void delete(int pointer);
}
