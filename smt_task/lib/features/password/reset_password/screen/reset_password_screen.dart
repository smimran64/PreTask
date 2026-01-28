import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/core/common/widgets/custom_text_field.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.02,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 24,
                  color: const Color(0xFF1F2937),
                ),
                SizedBox(height: size.height * 0.04),
                const Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.015),

                Center(
                  child: Text(
                    'Your password must be at least 8 characters\nlong and include a combination of letters,\nnumbers',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                Obx(() => CustomTextField(
                  controller: controller.newPasswordController,
                  label: 'New Password',
                  hintText: '••••••••',
                  isPassword: true,
                  isPasswordVisible: controller.isNewPasswordVisible.value,
                  onTogglePassword: controller.toggleNewPasswordVisibility,
                  validator: controller.validateNewPassword,
                )),
                SizedBox(height: size.height * 0.025),
                Obx(() => CustomTextField(
                  controller: controller.confirmPasswordController,
                  label: 'Confirm New Password',
                  hintText: '••••••••',
                  isPassword: true,
                  isPasswordVisible: controller.isConfirmPasswordVisible.value,
                  onTogglePassword: controller.toggleConfirmPasswordVisibility,
                  validator: controller.validateConfirmPassword,
                )),
                SizedBox(height: size.height * 0.04),

                Obx(() => CustomButton(
                  label: 'Submit',
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.submitNewPassword,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}