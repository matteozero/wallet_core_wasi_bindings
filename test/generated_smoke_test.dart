import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_wasi_bindings/wallet_core_wasi_bindings.dart';
import 'package:wasm_run/wasm_run.dart';

void main() {
  test('generated bindings: real HD wallet -> address derivation, twice', () async {
    await WasmRunLibrary.setUp(
      lib: ExternalLibrary.open(
        '/Users/lightningx/Working/aiworking/walletcore/wasm_run/target/release/libwasm_run_dart.dylib',
      ),
    );

    final wasmBytes = await File('/tmp/reactor-test/reactor2.wasm').readAsBytes();
    await WalletCoreWasiWasm.initialize(wasmBytes: wasmBytes);

    // Round 1.
    final wallet1 = TWHDWallet.create(128, '');
    final mnemonic1 = wallet1.mnemonic;
    print('mnemonic 1: $mnemonic1');
    expect(mnemonic1.split(' ').length, 12);
    final btc1 = wallet1.getAddressForCoin(TWCoinType.bitcoin);
    final eth1 = wallet1.getAddressForCoin(TWCoinType.ethereum);
    print('  bitcoin: $btc1');
    print('  ethereum: $eth1');
    expect(btc1, startsWith('bc1'));
    expect(eth1, startsWith('0x'));
    wallet1.delete();

    // Round 2, on a *second* instance -- proves the reactor module handles
    // repeated, independent calls correctly (not just a one-shot run).
    final wallet2 = TWHDWallet.create(128, '');
    final mnemonic2 = wallet2.mnemonic;
    print('mnemonic 2: $mnemonic2');
    expect(mnemonic2.split(' ').length, 12);
    expect(mnemonic2, isNot(equals(mnemonic1)));
    final btc2 = wallet2.getAddressForCoin(TWCoinType.bitcoin);
    final eth2 = wallet2.getAddressForCoin(TWCoinType.ethereum);
    print('  bitcoin: $btc2');
    print('  ethereum: $eth2');
    expect(btc2, startsWith('bc1'));
    expect(eth2, startsWith('0x'));
    expect(btc2, isNot(equals(btc1)));
    wallet2.delete();

    print('GENERATED BINDINGS SMOKE TEST PASSED');
  });
}
