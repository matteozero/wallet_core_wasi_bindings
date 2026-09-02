part of '../../wallet_core_wasi_bindings.dart';

class TWAnyAddressImpl extends TWAnyAddressInterface {
  TWAnyAddressImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int createWithString(int string, int coin) => wasm.callInt('TWAnyAddressCreateWithString', [string, coin]);

  @override
  int createBech32(int string, int coin, int hrp) => wasm.callInt('TWAnyAddressCreateBech32', [string, coin, hrp]);

  @override
  int createSS58(int string, int coin, int ss58Prefix) => wasm.callInt('TWAnyAddressCreateSS58', [string, coin, ss58Prefix]);

  @override
  int createWithPublicKey(int publicKey, int coin) => wasm.callInt('TWAnyAddressCreateWithPublicKey', [publicKey, coin]);

  @override
  int createWithPublicKeyDerivation(int publicKey, int coin, int derivation) => wasm.callInt('TWAnyAddressCreateWithPublicKeyDerivation', [publicKey, coin, derivation]);

  @override
  int createBech32WithPublicKey(int publicKey, int coin, int hrp) => wasm.callInt('TWAnyAddressCreateBech32WithPublicKey', [publicKey, coin, hrp]);

  @override
  int createSS58WithPublicKey(int publicKey, int coin, int ss58Prefix) => wasm.callInt('TWAnyAddressCreateSS58WithPublicKey', [publicKey, coin, ss58Prefix]);

  @override
  int createWithPublicKeyFilecoinAddressType(int publicKey, int filecoinAddressType) => wasm.callInt('TWAnyAddressCreateWithPublicKeyFilecoinAddressType', [publicKey, filecoinAddressType]);

  @override
  void delete(int pointer) => wasm.callVoid('TWAnyAddressDelete', [pointer]);

  @override
  bool equal(int lhs, int rhs) => wasm.callBool('TWAnyAddressEqual', [lhs, rhs]);

  @override
  bool isValid(int string, int coin) => wasm.callBool('TWAnyAddressIsValid', [string, coin]);

  @override
  bool isValidBech32(int string, int coin, int hrp) => wasm.callBool('TWAnyAddressIsValidBech32', [string, coin, hrp]);

  @override
  bool isValidSS58(int string, int coin, int ss58Prefix) => wasm.callBool('TWAnyAddressIsValidSS58', [string, coin, ss58Prefix]);

  @override
  int createWithPublicKeyFiroAddressType(int publicKey, int firoAddressType) => wasm.callInt('TWAnyAddressCreateWithPublicKeyFiroAddressType', [publicKey, firoAddressType]);

  @override
  int description(int pointer) => wasm.callInt('TWAnyAddressDescription', [pointer]);

  @override
  int coin(int pointer) => wasm.callInt('TWAnyAddressCoin', [pointer]);

  @override
  int data(int pointer) => wasm.callInt('TWAnyAddressData', [pointer]);

}
