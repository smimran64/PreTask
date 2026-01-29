import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/core/common/widgets/custom_text_field.dart';
import 'package:smt_task/features/products/controller/product_controller.dart';

class EditProductScreen extends StatelessWidget {
  final String productId;
  const EditProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    final List<String> dataFields = ['capacity', 'price', 'generation'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Refine Product",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: controller.editNameCtrl,
              label: "Product Name",
              hintText: "Enter updated name",
            ),
            const SizedBox(height: 25),
            const Text(
              "Additional Specifications",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const Divider(),
            const SizedBox(height: 10),
            ...dataFields.map((field) {
              if (!controller.editData.containsKey(field)) {
                controller.editData[field] = TextEditingController();
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CustomTextField(
                  controller: controller.editData[field]!,
                  label: field.capitalizeFirst!,
                  hintText: "Enter ${field.toLowerCase()}",
                ),
              );
            }),
            const SizedBox(height: 30),

            CustomButton(
              label: "Update Product Details",
              onPressed: () => controller.updateProduct(productId),
            ),
          ],
        ),
      ),
    );
  }
}
