import 'package:flutter/material.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String strength;

  const PasswordStrengthIndicator({
    super.key,
    required this.strength,
  });

  Color _getStrengthColor() {
    switch (strength) {
      case 'Weak':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Strong':
        return Colors.green;
      default:
        return Colors.grey.shade300;
    }
  }

  double _getStrengthProgress() {
    switch (strength) {
      case 'Weak':
        return 0.33;
      case 'Medium':
        return 0.66;
      case 'Strong':
        return 1.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.01),
        
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: _getStrengthProgress(),
            minHeight: 4,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(_getStrengthColor()),
          ),
        ),
        
        SizedBox(height: size.height * 0.015),
        
        Row(
          children: [
            if (strength.isNotEmpty) ...[
              Icon(
                strength == 'Strong' 
                    ? Icons.check_circle 
                    : Icons.info_outline,
                size: 16,
                color: _getStrengthColor(),
              ),
              const SizedBox(width: 6),
            ],
            Expanded(
              child: Text(
                strength.isEmpty
                    ? 'At least 8 characters with a combination of letters and numbers'
                    : strength == 'Strong'
                        ? 'At least 8 characters with a combination of letters and numbers'
                        : 'At least 8 characters with a combination of letters and numbers',
                style: TextStyle(
                  fontSize: 12,
                  color: strength.isEmpty 
                      ? Colors.grey.shade600 
                      : _getStrengthColor(),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (strength.isNotEmpty)
              Text(
                strength,
                style: TextStyle(
                  fontSize: 12,
                  color: _getStrengthColor(),
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ],
    );
  }
}