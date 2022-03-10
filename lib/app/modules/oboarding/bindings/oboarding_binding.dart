import 'package:get/get.dart';

import '../controllers/oboarding_controller.dart';

class OboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OboardingController>(
      () => OboardingController(),
    );
  }
}
