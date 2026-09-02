part of '../../wallet_core_wasi_bindings.dart';

/// Thin convenience wrapper around a [WasmInstance] running the
/// wallet-core WASI *reactor* module (built with `-mexec-model=reactor`, all
/// `TW*` symbols exported, `--export-all`/`--whole-archive`'d): the instance
/// stays alive across arbitrarily many calls, unlike the earlier
/// *command*-style (`_start`-only, run-once) build.
class WasiReactorModule {
  WasiReactorModule(this.instance)
    : _malloc = instance.getFunction('malloc')!,
      _free = instance.getFunction('free')!,
      _memory = instance.getMemory('memory')!;

  final WasmInstance instance;
  final WasmFunction _malloc;
  final WasmFunction _free;
  final WasmMemory _memory;

  int malloc(int size) => _malloc([size]).first as int;

  void free(int pointer) => _free([pointer]);

  /// Reads exactly [length] bytes starting at [pointer].
  Uint8List readBytes(int pointer, int length) =>
      Uint8List.fromList(_memory.view.sublist(pointer, pointer + length));

  /// Writes [bytes] starting at [pointer]. Caller must have malloc'd enough
  /// room (`bytes.length` bytes).
  void writeBytes(int pointer, Uint8List bytes) {
    _memory.view.setRange(pointer, pointer + bytes.length, bytes);
  }

  /// Mallocs, writes, and returns a pointer to a scratch buffer holding
  /// [bytes]; caller must [free] it once done (this is for raw temporary
  /// buffers only, never for the resulting `TWString*`/`TWData*` handle,
  /// which has its own lifetime managed by [TWString]/[TWData]).
  int mallocBytes(Uint8List bytes) {
    final ptr = malloc(bytes.length);
    writeBytes(ptr, bytes);
    return ptr;
  }

  /// Same as [mallocBytes] but appends a trailing NUL, for APIs expecting a
  /// null-terminated C string (`const char*`).
  int mallocCString(String value) {
    final bytes = Uint8List.fromList([...utf8.encode(value), 0]);
    return mallocBytes(bytes);
  }

  /// Reads a null-terminated C string starting at [pointer].
  String readCString(int pointer) {
    final data = _memory.view;
    var end = pointer;
    while (data[end] != 0) {
      end++;
    }
    return utf8.decode(data.sublist(pointer, end));
  }

  int callInt(String name, List<Object?> args) => call(name, args).first as int;

  bool callBool(String name, List<Object?> args) => (call(name, args).first as int) != 0;

  double callDouble(String name, List<Object?> args) => call(name, args).first as double;

  void callVoid(String name, List<Object?> args) => call(name, args);

  List<Object?> call(String name, List<Object?> args) {
    final f = instance.getFunction(name);
    if (f == null) {
      throw StateError('wallet-core wasm module has no exported function "$name"');
    }
    return f(args);
  }
}
