dh
==
[![Pub Package](https://img.shields.io/pub/v/dh.svg)](https://pub.dartlang.org/packages/dh)
[![Build Status](https://travis-ci.org/kseo/dh.svg?branch=master)](https://travis-ci.org/kseo/dh)
[![GitHub License](https://img.shields.io/badge/license-BSD-blue.svg)](https://raw.githubusercontent.com/kseo/dh/master/LICENSE)

Diffie-Hellman Key-exchange algorithm in Dart

## Example

```dart
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

```
