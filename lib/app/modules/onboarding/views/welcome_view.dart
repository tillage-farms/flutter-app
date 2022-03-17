import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/routes/qlevar_router.dart';
import 'package:tillage_farms/app/theme/core/values/colors.dart';

class WelcomeView extends StatelessWidget {
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
                      style: TextStyle(
                        color: AppColors.primaryAccentColor,
                      ),
                    ),
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
                      onPressed: () => QR.toName(AppRoutes.signUp),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryAccentColor,
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
                      onPressed: () => QR.toName(AppRoutes.signIn),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: AppColors.primaryColor,
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
