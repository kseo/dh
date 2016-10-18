// Copyright (c) 2016, Kwang Yul Seo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dh/dh.dart';
import 'package:propcheck/propcheck.dart';
import 'package:test/test.dart';

import 'src/keys.dart';

final Property computesTheSameSecretKeyProp =
    forall2(keys, keys, (DhKey aliceKey, DhKey bobKey) {
  String alicePubKey = aliceKey.publicKey;
  String bobPubKey = bobKey.publicKey;

  // Exchange and generate the secret...
  int secretKey1 = aliceKey.computeKey(new DhKey.fromPublicKey(bobPubKey));
  int secretKey2 = bobKey.computeKey(new DhKey.fromPublicKey(alicePubKey));

  return secretKey1 == secretKey2;
});

void main() {
  group('DH', () {
    test('computes the same secret key', () {
      final qc = new QuickCheck(maxSize: 500, seed: 42);
      qc.check(computesTheSameSecretKeyProp);
    });
  });
}
