import 'package:get/get.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tillage_farms/app/middlewares/app_middlewares.dart';
import 'package:tillage_farms/app/modules/home/views/home_view.dart';
import 'package:tillage_farms/app/modules/onboarding/views/business_info.dart';
import 'package:tillage_farms/app/modules/onboarding/views/business_location.dart';
import 'package:tillage_farms/app/modules/onboarding/views/welcome_view.dart';
import 'package:tillage_farms/app/modules/onboarding/views/auth_view.dart';
import 'package:tillage_farms/app/modules/onboarding/views/onboarding_view.dart';

class AppRoutes extends GetxController {
  static const String welcome = "welcome";
  static const String home = "home";
  static const String signIn = "signIn";
  static const String signUp = "signUp";
  static const String onboarding = "onboarding";
  static const String businessInfo = "businessInf o";
  static const String businessLocation = "businessLocation";
  static const String categories = "categories";
  static const String cart = "cart";
  static const String wishlist = "wishlist";
  static const String profile = "profile";
  static const String more = "more";

  static List<QRoute> routes = [
    QRoute(
      path: "/welcome",
      name: welcome,
      builder: () => WelcomeView(),
      middleware: [
        GuestMiddleware(),
      ],
    ),
    QRoute(
      path: "/",
      name: home,
      builder: () => HomeView(),
      middleware: [
        AuthMiddleware(),
      ],
    ),
    QRoute.withChild(
      path: "/onboarding",
      name: onboarding,
      builderChild: (QRouter qRouter) => OnboardingView(qRouter: qRouter),
      children: [
        QRoute(
          path: "/sign-in",
          name: signIn,
          builder: () => AuthView(),
          middleware: [
            GuestMiddleware(),
          ],
        ),
        QRoute(
          path: "/sign-up",
          name: signUp,
          builder: () => AuthView(),
          middleware: [
            GuestMiddleware(),
          ],
        ),
        QRoute(
          path: "/business-info",
          name: businessInfo,
          builder: () => BusinessInfoView(),
          middleware: [
            GuestMiddleware(),
          ],
        ),
        QRoute(
          path: "/business-location",
          name: businessLocation,
          builder: () => BusinessLocationView(),
          middleware: [
            GuestMiddleware(),
          ],
        ), // ADd OTP view
      ],
    ),
  ];
}
