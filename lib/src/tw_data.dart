part of '../wallet_core_wasi_bindings.dart';

TWDataInterface get _twDataImpl => WalletCoreWasiBindings.backend<TWDataInterface>();

final Finalizer<int> _twDataFinalizer = Finalizer<int>((pointer) {
  _twDataImpl.delete(pointer);
});

/// TrustWalletCore's managed, resizable byte buffer. Consumers should
/// generally prefer plain Dart [Uint8List]s -- every generated API
/// takes/returns [Uint8List] directly -- but this is exposed for the rare API
/// that needs the pointer itself.
class TWData extends TWObjectFinalizable {
  TWData(Uint8List bytes) : super(_twDataImpl.createWithBytes(bytes), finalizer: _twDataFinalizer);

  TWData.withSize(int size) : super(_twDataImpl.createWithSize(size), finalizer: _twDataFinalizer);

  TWData.copyOf(TWData data)
    : super(_twDataImpl.createWithData(data.pointer), finalizer: _twDataFinalizer);

  /// Wraps an existing `TWData*` pointer returned by some other API call.
  /// Takes ownership (will be freed via [delete]/the finalizer).
  TWData.fromPointer(int pointer) : super(pointer, finalizer: _twDataFinalizer);

  /// Returns `null` if [hex] is not valid hex.
  static TWData? createWithHexString(String hex) {
    final ptr = _twDataImpl.createWithHexString(hex);
    return ptr == 0 ? null : TWData.fromPointer(ptr);
  }

  int get size => _twDataImpl.size(pointer);

  Uint8List get bytes => _twDataImpl.bytes(pointer);

  void setByte(int index, int byte) => _twDataImpl.setByte(pointer, index, byte);

  /// Returns true on success.
  bool copyBytes(int start, int size, Uint8List output) =>
      _twDataImpl.copyBytes(pointer, start, size, output);

  /// Returns true on success.
  bool replaceBytes(int start, int size, Uint8List bytes) =>
      _twDataImpl.replaceBytes(pointer, start, size, bytes);

  void appendBytes(Uint8List bytes) => _twDataImpl.appendBytes(pointer, bytes);

  void appendByte(int byte) => _twDataImpl.appendByte(pointer, byte);

  void appendData(TWData other) => _twDataImpl.appendData(pointer, other.pointer);

  void reverse() => _twDataImpl.reverse(pointer);

  void reset() => _twDataImpl.reset(pointer);

  bool equals(TWData other) => _twDataImpl.equal(pointer, other.pointer);

  void delete() => disposeWith(_twDataImpl.delete);
}
