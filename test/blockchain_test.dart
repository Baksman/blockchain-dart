import 'dart:convert';
import 'package:blockchain/blockchain.dart';
import 'package:blockchain/miner.dart';
import 'package:test/test.dart';

void main() {
  group('Blockchain', () {
    test('First Test', () {
      var b = new Blockchain();
      expect(b, isNotNull);
      var blockIndex = b.newTransaction("john", "steve", 0.50);
      expect(blockIndex, 1);
      blockIndex = b.newTransaction("steve", "john", 1.50);
      expect(blockIndex, 1);
    });
  });

  group('Block', () {
    test('json encode', () {
      var b = new Block(0, 0, [], 0, "");
      var r = JSON.encode(b);
      expect(r, isNotNull);
    });
  });
  group('Miner', () {
    test('Test', () {
      var b = new Blockchain();
      var miner = new Miner(b);
      var result = miner.mine();
      expect(result, isNotNull);
      expect(result.prevHash, isNotNull);
      print(result);
    });
  });
}
