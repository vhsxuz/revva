import 'package:get/get.dart';
import 'package:revva/pages/onboarding/onboarding_screen.dart';

abstract class Routes {
  static const ONBOARDING = '/onboarding';
  static const HOME = '/home';
  // Add other routes...
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingScreen(),
      transition: Transition.cupertino,
    ),
    // Other pages...
  ];
}