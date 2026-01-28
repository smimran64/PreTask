import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PasswordResetSuccessDialog extends StatelessWidget {
  const PasswordResetSuccessDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.06),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),

            _buildSuccessIcon(size),

            SizedBox(height: size.height * 0.03),

            const Text(
              'Password Reset Successful',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: size.height * 0.015),

            Text(
              'Your password has been reset successfully.\nYou can now sign in with your new password.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: size.height * 0.035),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(); 
                  Get.offAllNamed('/signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessIcon(Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width * 0.35,
          height: size.width * 0.35,
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: size.width * 0.2,
          height: size.width * 0.2,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
          ),
        ),
      ],
    );
  }
}
void showPasswordResetSuccessDialog() {
  Get.dialog(
    const PasswordResetSuccessDialog(),
    barrierDismissible: false,
  );
}