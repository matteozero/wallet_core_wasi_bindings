part of '../wallet_core_wasi_bindings.dart';

TWStringInterface get _twStringImpl =>
    WalletCoreWasiBindings.backend<TWStringInterface>();

final Finalizer<int> _twStringFinalizer = Finalizer<int>((pointer) {
  _twStringImpl.delete(pointer);
});

/// TrustWalletCore's managed, resizable string. Consumers should generally
/// prefer plain Dart [String]s -- every generated API takes/returns [String]
/// directly -- but this is exposed for the rare API that needs the pointer
/// itself.
class TWString extends TWObjectFinalizable {
  TWString(String value) : super(_twStringImpl.create(value), finalizer: _twStringFinalizer);

  TWString.createWithRawBytes(Uint8List bytes)
    : super(_twStringImpl.createWithRawBytes(bytes), finalizer: _twStringFinalizer);

  TWString.createWithHexData(TWData data)
    : super(_twStringImpl.createWithHexData(data.pointer), finalizer: _twStringFinalizer);

  /// Wraps an existing `TWString*` pointer returned by some other API call.
  /// Takes ownership (will be freed via [delete]/the finalizer).
  TWString.fromPointer(int pointer) : super(pointer, finalizer: _twStringFinalizer);

  int get size => _twStringImpl.size(pointer);

  int byteAt(int index) => _twStringImpl.byteAt(pointer, index);

  /// The decoded Dart string value.
  String get value => _twStringImpl.utf8Bytes(pointer);

  bool equals(TWString other) => _twStringImpl.equal(pointer, other.pointer);

  void delete() => disposeWith(_twStringImpl.delete);
}
