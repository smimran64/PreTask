import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/core/common/widgets/custom_checkbox.dart';
import 'package:smt_task/core/common/widgets/custom_text_field.dart';
import 'package:smt_task/routes/app_routes.dart';
import '../controller/signin_controller.dart';

class SignInFormBody extends StatelessWidget {
  const SignInFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.menu_book_rounded,
              size: 45, color: Color(0xFF2563EB)),
        ),
        const SizedBox(height: 24),
        const Text(
          'Welcome Back!',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937)),
        ),
        const SizedBox(height: 8),
        const Text(
          'Please login first to start your Theory Test.',
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.04),
        CustomTextField(
          controller: controller.emailController,
          label: 'Email Address',
          hintText: 'pristia@gmail.com',
          validator: controller.validateEmail,
        ),
        const SizedBox(height: 20),
        Obx(() => CustomTextField(
              controller: controller.passwordController,
              label: 'Password',
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
                  onChanged: (val) => controller.toggleRememberMe(),
                  label: 'Remember Me',
                )),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.forgotpassword),
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.05),
        CustomButton(
          label: 'Sign In',
          onPressed: () {
            if (controller.formKey.currentState!.validate()) {
              Get.toNamed(AppRoutes.locationPermission);
            }
          },
        ),
        SizedBox(height: size.height * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('New to Theory Test? ',
                style: TextStyle(color: Colors.grey)),
            GestureDetector(
              onTap: controller.navigateToSignUp,
              child: const Text(
                'Create Account',
                style: TextStyle(
                    color: Color(0xFF2563EB), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
