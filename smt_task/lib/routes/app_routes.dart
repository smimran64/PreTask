import 'package:get/get.dart';
import 'package:smt_task/features/auth/signIn/screens/signin_screen.dart';
import 'package:smt_task/features/auth/signup/screen/signup_screen.dart';
import 'package:smt_task/features/language/screen/language_screen.dart';
import 'package:smt_task/features/location/screen/location_screen.dart';
import 'package:smt_task/features/password/forgot_password/screen/forgot_password_screen.dart';
import 'package:smt_task/features/password/reset_password/screen/reset_password_screen.dart';
import 'package:smt_task/features/password/verify_code/screen/verify_code_screen.dart';
import 'package:smt_task/features/products/form/product_form.dart';
import 'package:smt_task/features/products/screen/product_screen.dart';
import 'package:smt_task/features/splash/bindings/splash_binding.dart';
import 'package:smt_task/features/splash/screen/splash_screen.dart';
import '../features/onboarding/screens/onborading_screen.dart';

class AppRoutes {
  static String splash = '/splash';
  static String onboarding = '/onboarding';
  static String signup = '/signup';
  static String signin = '/signin';
  static String forgotpassword = '/forgot_password';
  static String resetpassword = '/reset_password';
  static String verifycode = '/verify_code';
  static String locationPermission = '/location_permission';
  static String languageSelection = '/language_selection';
  static String productList = '/product_list';
  static String productForm = '/product_form';

  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.signin, page: () => const SignInScreen()),
    GetPage(
      name: AppRoutes.forgotpassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.resetpassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(name: AppRoutes.verifycode, page: () => const VerifyCodeScreen()),
    GetPage(name: AppRoutes.locationPermission, page: () => LocationPermissionScreen()),
    GetPage(name: AppRoutes.languageSelection, page: () =>  LanguageSelectionScreen()),
    GetPage(name: AppRoutes.productList, page: () =>  ProductScreen()),
    GetPage(name: AppRoutes.productForm, page: () =>  AddProductForm()),
  ];
}
