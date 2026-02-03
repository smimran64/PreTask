import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sva_task/core/common_widgets/custom_button.dart';
import 'package:sva_task/core/constants/image_path.dart';
import 'package:sva_task/features/location/controller/location_controller.dart';
import 'package:sva_task/routes/app_routes.dart';

class TravelAlarmScreen extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  TravelAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1138), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome! Your Smart\nTravel Alarm",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Stay on schedule and enjoy every\nmoment of your journey.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(ImagePath.location),
            ),
            SizedBox(height: 40),
            Obx(
              () => Text(
                "Selected Location: ${controller.currentLocation.value}",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : CustomButton(
                      text: "Use Current Location",
                      isOutlined: true,
                      icon: Icons.location_on_outlined,
                      onPressed: () {
                        controller.determinePosition();
                      },
                    ),
            ),

            SizedBox(height: 15),
            CustomButton(
              text: "Home",
              backgroundColor: const Color(
                0xFF5311FF,
              ),
              onPressed: () => Get.toNamed(AppRoutes.home),
            ),
          ],
        ),
      ),
    );
  }
}
