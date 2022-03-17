import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:tillage_farms/app/theme/core/values/colors.dart';
import 'package:tillage_farms/app/widgets/buttons.dart';

class SignUpView extends GetView<OnboardingController> {
  const SignUpView({Key? key}) : super(key: key);

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
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_circle_left,
            color: AppColors.primaryAccentColor,
            size: 32,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                const Text(
                  'Enter your email and password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Safe & Secure. We will never share your data',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: controller.emailTextEditingController,
                  // initialValue: controller.email,
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
                    // initialValue: controller.password,
                    onChanged: (value) => controller.password = value,
                    obscureText: controller.obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscureText
                              ? Iconsax.eye4
                              : Iconsax.eye_slash5,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                PrimaryButton(
                  onPressed: () => controller.createAccount(),
                  text: "Continue",
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
