
import 'package:flutter/material.dart';

class LocationIconWidget extends StatelessWidget {
  const LocationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 10,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(100, 80),
            painter: MapPainter(),
          ),
          
          Positioned(
            top: 45,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFEC4899),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = const Color(0xFF10B981);
    final greenPath = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.2,
        size.width * 0.3,
        size.height * 0.4,
      )
      ..lineTo(size.width * 0.2, size.height * 0.8)
      ..quadraticBezierTo(
        size.width * 0.1,
        size.height * 0.9,
        0,
        size.height * 0.7,
      )
      ..close();
    canvas.drawPath(greenPath, paint);

    paint.color = const Color(0xFFFBBF24);
    final yellowPath = Path()
      ..moveTo(size.width * 0.1, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.6,
        size.width * 0.3,
        size.height * 0.8,
      )
      ..lineTo(size.width * 0.1, size.height)
      ..lineTo(0, size.height * 0.8)
      ..close();
    canvas.drawPath(yellowPath, paint);

    paint.color = const Color(0xFF3B82F6);
    final bluePath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.2)
      ..quadraticBezierTo(
        size.width * 0.7,
        size.height * 0.3,
        size.width * 0.8,
        size.height * 0.5,
      )
      ..lineTo(size.width, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.3)
      ..close();
    canvas.drawPath(bluePath, paint);

    paint.color = const Color(0xFFF97316);
    final orangePath = Path()
      ..moveTo(size.width * 0.4, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.6,
        size.height * 0.7,
        size.width * 0.7,
        size.height * 0.9,
      )
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width * 0.3, size.height * 0.85)
      ..close();
    canvas.drawPath(orangePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}