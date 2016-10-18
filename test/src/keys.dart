// Copyright (c) 2016, Kwang Yul Seo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dh/dh.dart';
import 'package:enumerators/combinators.dart' as co;
import 'package:enumerators/enumerators.dart' as en;

DhGroup _group = new DhGroup.byGroupId(14);

dhKey(r) => _group.generateKey();

final keys = en.singleton(dhKey).apply(co.ints);

