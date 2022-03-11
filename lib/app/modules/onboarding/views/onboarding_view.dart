import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tillage_farms/app/modules/onboarding/bindings/auth_binding.dart';
import 'package:tillage_farms/app/modules/onboarding/views/email_and_password_view.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/pattern_bg.png",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 52),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(text: "Where\n"),
                    TextSpan(text: "Restaurants in\n"),
                    TextSpan(text: "Africa buy\n"),
                    TextSpan(text: "food"),
                    TextSpan(
                        text: " supplies.",
                        style: TextStyle(color: Color(0xFFA5DAA3))),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: SvgPicture.asset("assets/svg/loader.svg"),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFA5DAA3),
                        onPrimary: Colors.white,
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => EmailAndPassword(),
                            binding: AuthBinding());
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Color(0xFF4BB547),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
