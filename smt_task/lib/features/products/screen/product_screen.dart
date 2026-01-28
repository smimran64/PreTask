import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smt_task/features/products/controller/product_controller.dart';
import 'package:smt_task/features/products/form/product_form.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final c = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {          
           showAddProductBottomSheet(); 
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [    
          Expanded(
            child: Obx(() {
              if (c.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: c.products.length,
                itemBuilder: (_, i) {
                  final p = c.products[i];
                  return Card(
                    child: ListTile(
                      title: Text(p.name),
                      subtitle: Text(p.data.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => showEditBottomSheet(p),
                          ),
                          Obx(() => IconButton(
                            icon: c.isDeleting.value
                                ? const CircularProgressIndicator()
                                : const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              showDeleteConfirm(
                                () => c.deleteProduct(p.id!),
                              );
                            },
                          )),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
