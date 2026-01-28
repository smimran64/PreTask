import 'package:flutter/material.dart';

class CustomNumberPadWidget extends StatelessWidget {
  final Function(String) onNumberTap;
  final VoidCallback onBackspace;

  const CustomNumberPadWidget({
    super.key,
    required this.onNumberTap,
    required this.onBackspace,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNumberRow(['1', '2', '3']),
        const SizedBox(height: 16),
        _buildNumberRow(['4', '5', '6']),
        const SizedBox(height: 16),
        _buildNumberRow(['7', '8', '9']),
        const SizedBox(height: 16),
        _buildNumberRow(['.', '0', 'backspace']),
      ],
    );
  }
  Widget _buildNumberRow(List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((number) => _buildNumberButton(number)).toList(),
    );
  }
  Widget _buildNumberButton(String value) {
    if (value == '.') {
      return const SizedBox(width: 80, height: 60);
    }

    if (value == 'backspace') {
      return GestureDetector(
        onTap: onBackspace,
        child: Container(
          width: 80,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.backspace_outlined,
            size: 28,
            color: Color(0xFF1F2937),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () => onNumberTap(value),
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
            ),
          ),
        ),
      ),
    );
  }
}