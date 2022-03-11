import 'dart:async';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nhost_flutter_auth/nhost_flutter_auth.dart';

class PersistentAuthStoreProvider extends AuthStore {
  final Box box = Get.find<Box>();
  @override
  FutureOr<String?> getString(String key) {
    return box.get(key);
  }

  @override
  FutureOr<void> removeItem(String key) {
    box.delete(key);
  }

  @override
  FutureOr<void> setString(String key, String value) {
    box.put(key, value);
  }
}
