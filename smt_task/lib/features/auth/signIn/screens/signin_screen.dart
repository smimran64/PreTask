import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/core/common/widgets/custom_checkbox.dart';
import 'package:smt_task/core/common/widgets/custom_text_field.dart';
import 'package:smt_task/routes/app_routes.dart';
import '../controller/signin_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.03,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),

                Container(
                  width: size.width * 0.25,
                  height: size.width * 0.25,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.menu_book_rounded,
                    size: size.width * 0.15,
                    color: const Color(0xFF2563EB),
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                Text(
                  'Please login first to start your Theory Test.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: size.height * 0.04),

                CustomTextField(
                  controller: controller.emailController,
                  label: 'Email Address',
                  hintText: 'pristia@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                ),

                SizedBox(height: size.height * 0.025),

                Obx(() => CustomTextField(
                  controller: controller.passwordController,
                  label: 'Password',
                  hintText: '••••••••',
                  isPassword: true,
                  isPasswordVisible: controller.isPasswordVisible.value,
                  onTogglePassword: controller.togglePasswordVisibility,
                  validator: controller.validatePassword,
                )),

                SizedBox(height: size.height * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => CustomCheckbox(
                      value: controller.rememberMe.value,
                      onChanged: (_) => controller.toggleRememberMe(),
                      label: 'Remember Me',
                    )),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.forgotpassword),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.04),

                CustomButton(
                  label: 'Sign In',
                  onPressed: () => Get.toNamed(AppRoutes.locationPermission),
                ),

                SizedBox(height: size.height * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Theory Test? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.navigateToSignUp,
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2563EB),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}