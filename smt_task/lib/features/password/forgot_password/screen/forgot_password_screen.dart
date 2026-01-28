import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/core/common/widgets/custom_text_field.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
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
                    'Forgot Password',
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
                    'Enter your email, we will send a\nverification code to email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: size.height * 0.04),
                CustomTextField(
                  controller: controller.emailController,
                  label: 'Email Address',
                  hintText: 'pristia@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                ),

                SizedBox(height: size.height * 0.04),

                Obx(() => CustomButton(
                  label: 'Continue',
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.sendVerificationCode,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}