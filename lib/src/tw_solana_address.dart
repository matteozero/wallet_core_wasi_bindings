part of '../wallet_core_wasi_bindings.dart';

TWSolanaAddressInterface get _tWSolanaAddressImpl => WalletCoreWasiBindings.backend<TWSolanaAddressInterface>();

final Finalizer<int> _tWSolanaAddressFinalizer = Finalizer<int>((pointer) {
  _tWSolanaAddressImpl.delete(pointer);
});

class TWSolanaAddress extends TWObjectFinalizable {
  factory TWSolanaAddress.createWithString(String string) {
    final _stringStr = TWString(string);

    final _ptr = _tWSolanaAddressImpl.createWithString(_stringStr.pointer);
    _stringStr.delete();
    if (_ptr == 0) throw StateError('TWSolanaAddressCreateWithString failed');
    return TWSolanaAddress.fromPointer(_ptr);
  }

  TWSolanaAddress.fromPointer(int pointer) : super(pointer, finalizer: _tWSolanaAddressFinalizer);

  String? defaultTokenAddress(String tokenMintAddress) {
    final _tokenMintAddressStr = TWString(tokenMintAddress);

    final _r = _tWSolanaAddressImpl.defaultTokenAddress(pointer, _tokenMintAddressStr.pointer);
    _tokenMintAddressStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  String? token2022Address(String tokenMintAddress) {
    final _tokenMintAddressStr = TWString(tokenMintAddress);

    final _r = _tWSolanaAddressImpl.token2022Address(pointer, _tokenMintAddressStr.pointer);
    _tokenMintAddressStr.delete();
    return ((_r) == 0 ? null : TWString.fromPointer(_r).value);
  }

  String get description {
    final _r = _tWSolanaAddressImpl.description(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWSolanaAddressImpl.delete);
}
