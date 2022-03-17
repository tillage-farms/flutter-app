import 'package:get/get.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/data/providers/appwrite_account_provider.dart';

class AuthMiddleware extends QMiddleware {
  AppwriteAccountProvider appwriteAccountProvider =
      Get.find<AppwriteAccountProvider>();

  @override
  Future<String?> redirectGuard(String path) async {
    if (appwriteAccountProvider.currentSession == null) return "/welcome";
    return super.redirectGuard(path);
  }
}

class GuestMiddleware extends QMiddleware {
  AppwriteAccountProvider appwriteAccountProvider =
      Get.find<AppwriteAccountProvider>();

  @override
  Future<String?> redirectGuard(String path) async {
    if (appwriteAccountProvider.currentSession == null) return "/";
    return super.redirectGuard(path);
  }
}
