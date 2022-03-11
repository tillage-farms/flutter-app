import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tillage_farms/app/data/providers/appwrite_account_provider.dart';
import 'package:tillage_farms/environment.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  await dotenv.load(fileName: Environment.FILE_NAME);
  await initializeApp();
}

Future<void> initializeApp() async {
  final Box box = await Get.putAsync<Box>(() => Hive.openBox("app_storage"));

  Client client = Client();
  client
      .setEndpoint(Environment.ENDPOINT)
      .setProject(Environment.PROJECT_ID)
      .setSelfSigned();

  Get.put<Box>(box, permanent: true);
  Get.put<Client>(client, permanent: true);
  Get.create((() => AppwriteAccountProvider()));

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
