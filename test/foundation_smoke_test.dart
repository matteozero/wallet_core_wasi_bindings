import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_wasi_bindings/wallet_core_wasi_bindings.dart';
import 'package:wasm_run/wasm_run.dart';

void main() {
  test('TWString/TWData round-trip through the real reactor wasm module', () async {
    await WasmRunLibrary.setUp(
      lib: ExternalLibrary.open(
        '/Users/lightningx/Working/aiworking/walletcore/wasm_run/target/release/libwasm_run_dart.dylib',
      ),
    );

    final wasmBytes = await File('/tmp/reactor-test/reactor2.wasm').readAsBytes();
    await WalletCoreWasiWasm.initialize(wasmBytes: wasmBytes);

    final s = TWString('hello wasi');
    expect(s.size, 10);
    expect(s.value, 'hello wasi');
    final s2 = TWString('hello wasi');
    expect(s.equals(s2), isTrue);
    s.delete();
    s2.delete();

    final d = TWData(Uint8List.fromList([1, 2, 3, 4]));
    expect(d.size, 4);
    expect(d.bytes, [1, 2, 3, 4]);
    d.appendByte(5);
    expect(d.bytes, [1, 2, 3, 4, 5]);
    d.delete();

    final hexData = TWData.createWithHexString('deadbeef');
    expect(hexData, isNotNull);
    expect(hexData!.bytes, [0xde, 0xad, 0xbe, 0xef]);
    hexData.delete();

    print('FOUNDATION SMOKE TEST PASSED');
  });
}
