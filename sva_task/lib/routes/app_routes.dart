import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sva_task/features/home/screens/home_screen.dart';
import 'package:sva_task/features/location/screens/location_screen.dart';
import 'package:sva_task/features/onboarding/screen/onboarding_screen.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String location = '/location';
  static const String home = '/home';

  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => const OnboardingScreen()),

    GetPage(name: location, page: () => TravelAlarmScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
