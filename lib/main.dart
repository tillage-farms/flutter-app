import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nhost_flutter_auth/nhost_flutter_auth.dart';
import 'package:tillage_farms/app/data/providers/auth_store_provider.dart';
import 'package:tillage_farms/environment.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  await dotenv.load(fileName: Environment.FILE_NAME);
  await initializeApp();
}

Future<void> initializeApp() async {
  final Box box = await Get.putAsync<Box>(() => Hive.openBox("app_storage"));

  final PersistentAuthStoreProvider persistentAuthStoreProvider =
      Get.put(PersistentAuthStoreProvider());

  final NhostClient nhostClient = Get.put(
    NhostClient(
      baseUrl: Environment.NHOST_URL,
      authStore: persistentAuthStoreProvider,
      autoLogin: true,
      // refreshToken: "",
      // tokenRefreshInterval: Duration(days: 1),
    ),
    permanent: true,
  );

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
