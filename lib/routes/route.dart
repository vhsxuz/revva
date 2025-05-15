import 'package:get/get.dart';
import 'package:revva/pages/news/news.dart';
import 'package:revva/pages/onboarding/onboarding_screen.dart';

abstract class Routes {
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  static const NEWS = '/news';
  // Add other routes...
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.NEWS,
      page: () => News(),
      transition: Transition.cupertino,
    ),
    // Other pages...
  ];
}