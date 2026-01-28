import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/features/location/controller/location_controller.dart';
import 'package:smt_task/features/location/widgets/location_widget.dart';
import 'package:smt_task/features/location/widgets/secondary_button_widgets.dart';
import 'package:smt_task/routes/app_routes.dart';

class LocationPermissionScreen extends StatelessWidget {
  LocationPermissionScreen({super.key});

  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const LocationIconWidget(),
              const SizedBox(height: 48),
              const Text(
                'Enable Location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Kindly allow us to access your location to provide you with suggestions for nearby salons',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B6B6B),
                  height: 1.5,
                  letterSpacing: 0.2,
                ),
              ),

              const Spacer(flex: 2),

              Obx(() => controller.isLoading.value
                  ? Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0XFF1B6EF7).withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    )
                  : CustomButton(
                      label: 'Enable',
                      onPressed: () => Get.toNamed(AppRoutes.languageSelection),
                    )),

              const SizedBox(height: 16),

              Obx(() => SecondaryButton(
                    label: 'Skip, Not Now',
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.skipLocationPermission();
                            Get.toNamed(AppRoutes.languageSelection);
                          },
                  )),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
