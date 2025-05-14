import 'package:get/get.dart';
import 'package:revva/pages/auth/forgot_password_page.dart';
import 'package:revva/pages/auth/login_page.dart';
import 'package:revva/pages/onboarding/onboarding_page_1.dart';
import 'package:revva/pages/onboarding/onboarding_screen.dart';

abstract class Routes {
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const FORGOTPASSWORD = '/forgot-password';
  // Other pages...
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.FORGOTPASSWORD,
      page: () => const ForgotPasswordPage(),
      transition: Transition.cupertino,
    ),
    // Other pages...
  ];
}
