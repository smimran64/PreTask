import 'package:flutter/material.dart';

class AlarmTile extends StatelessWidget {
  final String time;
  final String date;
  final bool isActive;
  final ValueChanged<bool> onToggle;

  const AlarmTile({
    super.key,
    required this.time,
    required this.date,
    required this.isActive,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ],
          ),
          Switch(
            value: isActive,
            onChanged: onToggle,
            // ignore: deprecated_member_use
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF5311FF),
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }
}
