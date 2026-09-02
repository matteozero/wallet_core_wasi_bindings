part of '../../wallet_core_wasi_bindings.dart';

class TWAsnParserImpl extends TWAsnParserInterface {
  TWAsnParserImpl(this.wasm);
  final WasiReactorModule wasm;

  @override
  int ecdsaSignatureFromDer(int encoded) => wasm.callInt('TWAsnParserEcdsaSignatureFromDer', [encoded]);

}
