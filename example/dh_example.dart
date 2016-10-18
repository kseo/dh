// Copyright (c) 2016, Kwang Yul Seo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dh/dh.dart';

main() {
  // Generate Alice's keys...
  DhGroup alice = new DhGroup.byGroupId(14);
  DhKey aliceKey = alice.generateKey();
  String alicePubKey = aliceKey.publicKey;

  // Generate Bob's keys...
  DhGroup bob = new DhGroup(alice.prime, alice.generator);
  DhKey bobKey = bob.generateKey();
  String bobPubKey = bobKey.publicKey;

  // Exchange and generate the secret...
  int secretKey1 = aliceKey.computeKey(new DhKey.fromPublicKey(bobPubKey));
  int secretKey2 = bobKey.computeKey(new DhKey.fromPublicKey(alicePubKey));

  // OK
  print(secretKey1);
  print(secretKey1 == secretKey2);
}

