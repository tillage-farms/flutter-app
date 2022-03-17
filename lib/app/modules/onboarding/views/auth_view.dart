import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:tillage_farms/app/routes/qlevar_router.dart';
import 'package:tillage_farms/app/theme/core/values/colors.dart';

class AuthView extends GetView<OnboardingController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.emailTextEditingController,
            onChanged: (value) => controller.email = value,
            decoration: InputDecoration(
              hintText: "Enter email address",
              labelText: "Enter email address",
            ),
          ),
          const SizedBox(height: 30),
          Obx(
            () => TextFormField(
              controller: controller.passwordTextEditingController,
              onChanged: (value) => controller.password = value,
              obscureText: controller.obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscureText ? Iconsax.eye4 : Iconsax.eye_slash5,
                  ),
                  onPressed: () {
                    controller.toggleShowPassword();
                  },
                ),
                hintText: "Enter password",
                labelText: "Enter password",
              ),
            ),
          ),
          if (QR.isCurrentName(AppRoutes.signIn)) ...[
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                "I forgot my password",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
