part of '../wallet_core_wasi_bindings.dart';

TWAccountInterface get _tWAccountImpl => WalletCoreWasiBindings.backend<TWAccountInterface>();

final Finalizer<int> _tWAccountFinalizer = Finalizer<int>((pointer) {
  _tWAccountImpl.delete(pointer);
});

class TWAccount extends TWObjectFinalizable {
  factory TWAccount.create(String address, TWCoinType coin, TWDerivation derivation, String derivationPath, String publicKey, String extendedPublicKey) {
    final _addressStr = TWString(address);
final _derivationPathStr = TWString(derivationPath);
final _publicKeyStr = TWString(publicKey);
final _extendedPublicKeyStr = TWString(extendedPublicKey);

    final _ptr = _tWAccountImpl.create(_addressStr.pointer, coin.value, derivation.value, _derivationPathStr.pointer, _publicKeyStr.pointer, _extendedPublicKeyStr.pointer);
    _addressStr.delete();
    _derivationPathStr.delete();
    _publicKeyStr.delete();
    _extendedPublicKeyStr.delete();
    return TWAccount.fromPointer(_ptr);
  }

  TWAccount.fromPointer(int pointer) : super(pointer, finalizer: _tWAccountFinalizer);

  String get address {
    final _r = _tWAccountImpl.address(pointer);
    return TWString.fromPointer(_r).value;
  }

  TWCoinType get coin {
    final _r = _tWAccountImpl.coin(pointer);
    return TWCoinType.fromValue(_r);
  }

  TWDerivation get derivation {
    final _r = _tWAccountImpl.derivation(pointer);
    return TWDerivation.fromValue(_r);
  }

  String get derivationPath {
    final _r = _tWAccountImpl.derivationPath(pointer);
    return TWString.fromPointer(_r).value;
  }

  String get publicKey {
    final _r = _tWAccountImpl.publicKey(pointer);
    return TWString.fromPointer(_r).value;
  }

  String get extendedPublicKey {
    final _r = _tWAccountImpl.extendedPublicKey(pointer);
    return TWString.fromPointer(_r).value;
  }

  void delete() => disposeWith(_tWAccountImpl.delete);
}
