import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:tillage_farms/app/routes/qlevar_router.dart';
import 'package:tillage_farms/app/theme/core/values/colors.dart';
import 'package:tillage_farms/app/widgets/buttons.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key, required this.qRouter}) : super(key: key);

  final QRouter qRouter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => QR.back(),
          child: Icon(
            Icons.arrow_circle_left,
            color: AppColors.primaryAccentColor,
            size: 32,
          ),
        ),
        bottom: PreferredSize(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                controller.pageTitle,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              if (controller.pageSubTitle != null) ...[
                const SizedBox(height: 15),
                Text(
                  controller.pageSubTitle!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ],
            ],
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: qRouter,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryButton(
                onPressed: () => controller.onPrimaryButtonPressed(),
                text: controller.primaryButtonText,
              ),
              SizedBox(height: 20),
              if (controller.secondaryButtonText != null)
                SecondaryButton(
                  onPressed: () => controller.onSecondaryButtonPressed(),
                  text: controller.secondaryButtonText,
                )
            ],
          ),
        ),
      ),
    );
  }
}
