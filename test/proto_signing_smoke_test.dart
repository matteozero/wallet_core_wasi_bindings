import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_wasi_bindings/proto/Common.pb.dart' as tw_common;
import 'package:wallet_core_wasi_bindings/proto/Ethereum.pb.dart' as tw_eth;
import 'package:wallet_core_wasi_bindings/wallet_core_wasi_bindings.dart';
import 'package:wasm_run/wasm_run.dart';

/// Big-endian byte encoding matching what wallet-core's proto fields (raw
/// bytes, not varint) expect for chainId/gasPrice/gasLimit/amount.
Uint8List beBytes(BigInt value) {
  var hex = value.toRadixString(16);
  if (hex.length.isOdd) hex = '0$hex';
  final bytes = Uint8List(hex.length ~/ 2);
  for (var i = 0; i < bytes.length; i++) {
    bytes[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
  }
  return bytes;
}

void main() {
  test('build a real Ethereum SigningInput protobuf, sign it, parse SigningOutput', () async {
    await WasmRunLibrary.setUp(
      lib: ExternalLibrary.open(
        '/Users/lightningx/Working/aiworking/walletcore/wasm_run/target/release/libwasm_run_dart.dylib',
      ),
    );

    final wasmBytes = await File('/tmp/reactor-test/reactor2.wasm').readAsBytes();
    await WalletCoreWasiWasm.initialize(wasmBytes: wasmBytes);

    // A fresh, random test-only key -- not a real, funded wallet.
    final privateKey = TWPrivateKey.create();

    final input = tw_eth.SigningInput(
      chainId: beBytes(BigInt.from(1)), // mainnet
      nonce: beBytes(BigInt.from(9)),
      gasPrice: beBytes(BigInt.parse('d693a4', radix: 16)), // 3.6 gwei
      gasLimit: beBytes(BigInt.from(21000)),
      toAddress: '0xC37054b3b48C3317082E7ba872d7753D13da4986',
      privateKey: privateKey.data,
      transaction: tw_eth.Transaction(
        transfer: tw_eth.Transaction_Transfer(
          amount: beBytes(BigInt.parse('0348bca5a160', radix: 16)), // 924400000000000 wei
        ),
      ),
    );

    final outputBytes = TWAnySigner.sign(input.writeToBuffer(), TWCoinType.ethereum);
    final output = tw_eth.SigningOutput.fromBuffer(outputBytes);

    print('signing error: ${output.error}');
    print('encoded tx (${output.encoded.length} bytes): 0x${output.encoded.map((b) => b.toRadixString(16).padLeft(2, '0')).join()}');

    expect(output.error, tw_common.SigningError.OK);
    expect(output.encoded, isNotEmpty);
    // A signed legacy Ethereum tx is RLP-encoded starting with a list prefix
    // in the 0xf8.. range for this payload size -- a sanity check that we
    // got back a real encoded transaction, not empty/garbage bytes.
    expect(output.encoded.first, greaterThanOrEqualTo(0xc0));

    privateKey.delete();
    print('PROTO SIGNING SMOKE TEST PASSED');
  });
}
