import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smt_task/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    goNext();
  }

  void goNext() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onboarding);
  }
}
