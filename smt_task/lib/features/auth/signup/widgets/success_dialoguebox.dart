import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessRegistrationDialog extends StatelessWidget {
  final VoidCallback? onContinue;

  const SuccessRegistrationDialog({
    super.key,
    this.onContinue,
  });

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
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.02),

            _buildSuccessIcon(size),

            SizedBox(height: size.height * 0.03),

            const Text(
              'Successfully Registered',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              'Your account has been registered\nsuccessfully, now let\'s enjoy our features!',
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
                  if (onContinue != null) {
                    onContinue!();
                  } else {
                    Get.offAllNamed('/home'); 
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Continue',
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
        SizedBox(
          width: size.width * 0.5,
          height: size.width * 0.5,
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: size.width * 0.45,
                  height: size.width * 0.45,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size.width * 0.35,
                  height: size.width * 0.35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: size.width * 0.08,
                left: size.width * 0.08,
                child: _buildStar(10, const Color(0xFF2563EB)),
              ),
              Positioned(
                top: size.width * 0.05,
                right: size.width * 0.12,
                child: _buildStar(8, const Color(0xFF2563EB)),
              ),
              Positioned(
                bottom: size.width * 0.12,
                left: size.width * 0.06,
                child: _buildStar(12, const Color(0xFF2563EB)),
              ),
              Positioned(
                bottom: size.width * 0.08,
                right: size.width * 0.1,
                child: _buildStar(10, const Color(0xFF2563EB)),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.18,
          height: size.width * 0.18,
          decoration: const BoxDecoration(
            color: Color(0xFF2563EB),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
            weight: 3,
          ),
        ),
      ],
    );
  }

  Widget _buildStar(double size, Color color) {
    return Icon(
      Icons.add,
      size: size,
      color: color.withValues(alpha: 0.6)
    );
  }
}
void showSuccessRegistrationDialog({VoidCallback? onContinue}) {
  Get.dialog(
    SuccessRegistrationDialog(onContinue: onContinue),
    barrierDismissible: false,
  );
}