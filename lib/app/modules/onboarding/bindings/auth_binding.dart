import 'package:get/get.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/auth_controller.dart';

import '../controllers/onboarding_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
