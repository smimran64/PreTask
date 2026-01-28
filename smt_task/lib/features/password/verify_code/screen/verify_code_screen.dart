import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/features/password/verify_code/controller/verify_code_controller.dart';
import 'package:smt_task/features/password/verify_code/widgets/opt_input_widgets.dart';
import 'package:smt_task/features/password/verify_code/widgets/opt_number_pad_widget.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyCodeController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 24,
                  color: const Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              const Text(
                'Verify Code',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              SizedBox(height: size.height * 0.015),

              Obx(() => RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Please enter the code we just sent to\nemail ',
                    ),
                    TextSpan(
                      text: controller.email.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(height: size.height * 0.05),
              OTPInputWidget(
                controllers: controller.otpControllers,
                focusNodes: controller.otpFocusNodes,
              ),

              SizedBox(height: size.height * 0.04),

              Obx(() => GestureDetector(
                onTap: controller.remainingTime.value == 0
                    ? controller.resendCode
                    : null,
                child: Text(
                  controller.remainingTime.value > 0
                      ? 'Resend code in ${controller.formattedTime}'
                      : 'Resend code',
                  style: TextStyle(
                    fontSize: 14,
                    color: controller.remainingTime.value > 0
                        ? Colors.grey.shade600
                        : const Color(0xFF2563EB),
                    fontWeight: controller.remainingTime.value > 0
                        ? FontWeight.w400
                        : FontWeight.w600,
                  ),
                ),
              )),
              SizedBox(height: size.height * 0.06),

              CustomNumberPadWidget(
                onNumberTap: controller.onNumberTap,
                onBackspace: controller.onBackspace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}