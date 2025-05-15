import 'package:get/get.dart';
import 'package:revva/pages/auth/forgot_password_page.dart';
import 'package:revva/pages/auth/login_page.dart';
import 'package:revva/pages/auth/otp_page.dart';
import 'package:revva/pages/auth/register_page.dart';
import 'package:revva/pages/error/error_page.dart';
import 'package:revva/pages/notavailable/not_available_page.dart';
import 'package:revva/pages/onboarding/onboarding_screen.dart';

abstract class Routes {
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const FORGOTPASSWORD = '/forgot-password';
  static const REGISTER = '/register';
  static const OTP = '/otp';
  static const ERRORPAGE = '/errorpage';
  static const NOTAVAILABLE = '/notavailable';
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
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.ERRORPAGE, 
      page: () => ErrorPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.NOTAVAILABLE, 
      page: () => NotAvailablePage(),
      transition: Transition.cupertino,
    )
    // Other pages...
  ];
}
