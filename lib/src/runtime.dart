part of '../wallet_core_wasi_bindings.dart';

/// Backend-agnostic base class for every wrapper around an opaque `TW*`
/// pointer. Concrete backends (e.g. the wasm one) attach a [Finalizer] so the
/// underlying native/wasm object is freed even if the consumer forgets to
/// call `delete()` explicitly.
abstract class TWObjectFinalizable {
  TWObjectFinalizable(this._pointer, {Finalizer<int>? finalizer}) {
    if (finalizer != null) {
      finalizer.attach(this, _pointer, detach: this);
      _finalizer = finalizer;
    }
  }

  final int _pointer;
  Finalizer<int>? _finalizer;
  bool _deleted = false;

  /// The raw pointer (linear-memory address in the wasm instance) backing
  /// this object. Only meaningful to a backend implementation.
  int get pointer => _pointer;

  /// Explicitly frees the underlying object by calling [deleteFn] with the
  /// pointer, then detaches this object from its finalizer so the native
  /// delete is never called twice. Safe to call more than once -- only the
  /// first call actually invokes [deleteFn].
  ///
  /// Named `disposeWith` (not `delete`) so that generated subclasses can
  /// freely declare their own zero-argument `delete()` convenience method
  /// without an incompatible-override footgun.
  @protected
  void disposeWith(void Function(int pointer) deleteFn) {
    if (_deleted) return;
    _deleted = true;
    _finalizer?.detach(this);
    deleteFn(_pointer);
  }
}

/// Global registry of the currently-active backend implementations, one per
/// bindable class. Populated once by whichever backend package's
/// initialization routine runs (e.g. `WalletCoreWasiWasm.initialize()`).
class WalletCoreWasiBindings {
  WalletCoreWasiBindings._();

  static Map<Type, Object>? _backends;

  static void register(Map<Type, Object> backends) {
    _backends = backends;
  }

  static T backend<T>() {
    final backends = _backends;
    if (backends == null) {
      throw StateError(
        'No wallet-core backend registered yet. Call e.g. '
        'WalletCoreWasiWasm.initialize() before using any TW* class.',
      );
    }
    final b = backends[T];
    if (b == null) {
      throw StateError('No backend registered for $T');
    }
    return b as T;
  }
}
