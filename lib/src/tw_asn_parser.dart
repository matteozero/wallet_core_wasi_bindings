part of '../wallet_core_wasi_bindings.dart';

TWAsnParserInterface get _tWAsnParserImpl => WalletCoreWasiBindings.backend<TWAsnParserInterface>();

class TWAsnParser {
  TWAsnParser._();

  static Uint8List? ecdsaSignatureFromDer(Uint8List encoded) {
    final _encodedData = TWData(encoded);

    final _r = _tWAsnParserImpl.ecdsaSignatureFromDer(_encodedData.pointer);
    _encodedData.delete();
    return ((_r) == 0 ? null : TWData.fromPointer(_r).bytes);
  }

}
