import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade50.withValues(alpha: 0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF1B6EF7).withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0XFF1B6EF7), Color(0xFF6366F1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              border: Border.all(
                  color: const Color.fromARGB(255, 29, 67, 104)
                      .withValues(alpha: 0.8),
                  width: 3.0),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.shopping_bag_rounded,
                      color: Colors.white, size: 24),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    product.name.capitalizeFirst ?? product.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                _actionButton(Icons.edit_rounded, Colors.white, onEdit),
                const SizedBox(width: 10),
                _actionButton(Icons.delete_forever_rounded,
                    const Color.fromARGB(255, 244, 51, 51), onDelete),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 5, 5, 5).withValues(alpha: 0.8),
                  width: 3.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.auto_awesome,
                        size: 16, color: Color(0XFF1B6EF7)),
                    SizedBox(width: 8),
                    Text(
                      "PRODUCT DETAILS",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B7280),
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                if (product.data != null && product.data!.isNotEmpty)
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: product.data!.entries.map((entry) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0XFF1B6EF7).withValues(alpha: 0.1),
                              const Color(0xFF6366F1).withValues(alpha: 0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: const Color(0XFF1B6EF7)
                                  .withValues(alpha: 0.8)),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xFF374151)),
                            children: [
                              TextSpan(
                                text: "${entry.key.capitalizeFirst}: ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0XFF1B6EF7)),
                              ),
                              TextSpan(text: entry.value.toString()),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("No specifications found.",
                        style: TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 1, 1).withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}
