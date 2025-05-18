// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:revva/pages/auth/forgot_password_page.dart';
import 'package:revva/pages/auth/login_page.dart';
import 'package:revva/pages/finance/finance.dart';
import 'package:revva/pages/history/history_page.dart';
import 'package:revva/pages/home/home_page.dart';
import 'package:revva/pages/markets/market.dart';
import 'package:revva/pages/news/news.dart';
import 'package:revva/pages/auth/otp_page.dart';
import 'package:revva/pages/auth/register_page.dart';
import 'package:revva/pages/error/error_page.dart';
import 'package:revva/pages/notavailable/not_available_page.dart';
import 'package:revva/pages/onboarding/onboarding_screen.dart';
import 'package:revva/pages/promotion/promotion_page.dart';
import 'package:revva/pages/referral/referral_page.dart';
import 'package:revva/pages/setting/setting.dart';

abstract class Routes {
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const FORGOTPASSWORD = '/forgot-password';
  static const REGISTER = '/register';
  static const NEWS = '/news';
  static const OTP = '/otp';
  static const ERRORPAGE = '/errorpage';
  static const NOTAVAILABLE = '/notavailable';
  static const PROMOTION = '/promotion';
  static const REFERRAL = '/referral';
  static const MARKET = '/market';
  static const HISTORY = '/history';
  static const FINANCE = '/finance';
  static const SETTING = '/setting';
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
      name: Routes.HOME,
      page: () => HomePage(),
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
      name: Routes.NEWS,
      page: () => const News(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.MARKET,
      page: () => const Market(),
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
    ),
    GetPage(
      name: Routes.PROMOTION,
      page: () => PromotionPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.REFERRAL,
      page: () => ReferralPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.HISTORY,
      page: () => HistoryPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.FINANCE,
      page: () => Finance(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => Setting(),
      transition: Transition.cupertino,
    ),
    // Other pages...
  ];
}
