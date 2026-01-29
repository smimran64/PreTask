import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/core/common/widgets/custom_text_field.dart';
import 'package:smt_task/routes/app_routes.dart';
import '../controller/product_controller.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    final List<String> commonFields = ['capacity', 'price', 'CPU model'];
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text("Create Product",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0XFF1B6EF7), Color(0xFF6366F1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(Icons.info_outline, "Basic Information"),
            const SizedBox(height: 15),
            CustomTextField(
              controller: controller.addNameCtrl,
              label: "Product Name",
              hintText: "e.g. Apple MacBook Pro 16",
            ),
            const SizedBox(height: 30),
            _buildSectionHeader(
                Icons.settings_suggest_outlined, "Technical Specs"),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 15),
            ...commonFields.map((field) {
              if (!controller.addData.containsKey(field)) {
                controller.addData[field] = TextEditingController();
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: CustomTextField(
                  controller: controller.addData[field]!,
                  label: field.capitalizeFirst!,
                  hintText: "Enter ${field.toLowerCase()}",
                ),
              );
            }),
            const SizedBox(height: 40),
            CustomButton(
              label: "Save Product",
              onPressed: () => Get.toNamed(AppRoutes.productList),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: const Color(0XFF1B6EF7), size: 22),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF374151),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
