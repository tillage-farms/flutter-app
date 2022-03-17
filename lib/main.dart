import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/data/providers/appwrite_account_provider.dart';
import 'package:tillage_farms/app/data/providers/appwrite_database_provider.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:tillage_farms/app/routes/qlevar_router.dart';
import 'package:tillage_farms/app/theme/app_theme.dart';
import 'package:tillage_farms/app/widgets/buttons.dart';
import 'package:tillage_farms/environment.dart';

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

  Get.lazyPut(() => SubmitButtonController(), fenix: true);
  Get.lazyPut(() => box, fenix: true);
  Get.lazyPut(() => client, fenix: true);
  Get.lazyPut(() => AppwriteAccountProvider(), fenix: true);
  Get.lazyPut(() => AppwriteDatabaseProvider(), fenix: true);
  Get.lazyPut(() => OnboardingController(), fenix: true);

  runApp(
    GetMaterialApp.router(
      title: "Application",
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      routeInformationParser: QRouteInformationParser(),
      routerDelegate: QRouterDelegate(AppRoutes.routes),
    ),
  );
}
