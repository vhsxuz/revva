import 'package:get/get.dart';
import 'package:revva/pages/onboarding/onboarding_page_1.dart';

abstract class Routes {
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  // Add other routes...
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingPage1(),
      transition: Transition.cupertino,
    ),
    // Other pages...
  ];
}