part of '../wallet_core_wasi_bindings.dart';

TWBarzInterface get _tWBarzImpl => WalletCoreWasiBindings.backend<TWBarzInterface>();

class TWBarz {
  TWBarz._();

  static String getCounterfactualAddress(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWBarzImpl.getCounterfactualAddress(_inputData.pointer);
    _inputData.delete();
    return TWString.fromPointer(_r).value;
  }

  static Uint8List? getInitCode(String factory, TWPublicKey publicKey, String verificationFacet, int salt) {
    final _factoryStr = TWString(factory);
final _verificationFacetStr = TWString(verificationFacet);

    final _r = _tWBarzImpl.getInitCode(_factoryStr.pointer, publicKey.pointer, _verificationFacetStr.pointer, salt);
    _factoryStr.delete();
    _verificationFacetStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? getFormattedSignature(Uint8List signature, Uint8List challenge, Uint8List authenticatorData, String clientDataJson) {
    final _signatureData = TWData(signature);
final _challengeData = TWData(challenge);
final _authenticatorDataData = TWData(authenticatorData);
final _clientDataJsonStr = TWString(clientDataJson);

    final _r = _tWBarzImpl.getFormattedSignature(_signatureData.pointer, _challengeData.pointer, _authenticatorDataData.pointer, _clientDataJsonStr.pointer);
    _signatureData.delete();
    _challengeData.delete();
    _authenticatorDataData.delete();
    _clientDataJsonStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? getPrefixedMsgHash(Uint8List msgHash, String barzAddress, int chainId) {
    final _msgHashData = TWData(msgHash);
final _barzAddressStr = TWString(barzAddress);

    final _r = _tWBarzImpl.getPrefixedMsgHash(_msgHashData.pointer, _barzAddressStr.pointer, chainId);
    _msgHashData.delete();
    _barzAddressStr.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

  static Uint8List? getDiamondCutCode(Uint8List input) {
    final _inputData = TWData(input);

    final _r = _tWBarzImpl.getDiamondCutCode(_inputData.pointer);
    _inputData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
