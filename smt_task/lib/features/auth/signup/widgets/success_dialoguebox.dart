import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/routes/app_routes.dart';

void showSuccessRegistrationDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.close, color: Colors.grey.shade600, size: 24),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withOpacity(0.05),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xFF2563EB),
                  child: Icon(Icons.check, color: Colors.white, size: 40),
                ),
                const Positioned(
                    top: 10,
                    right: 10,
                    child:
                        Icon(Icons.star, color: Color(0xFF2563EB), size: 12)),
                const Positioned(
                    bottom: 20,
                    left: 0,
                    child:
                        Icon(Icons.star, color: Color(0xFF2563EB), size: 12)),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Successfully Registered',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Your account has been registered successfully, now let\'s enjoy our features!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
                label: 'Continue',
                onPressed: () => Get.toNamed(AppRoutes.signin)),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
