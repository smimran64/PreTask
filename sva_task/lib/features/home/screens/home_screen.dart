import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sva_task/features/home/controller/home_controller.dart';
import 'package:sva_task/features/location/controller/location_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final locationController = Get.find<LocationController>();

    return Scaffold(
      backgroundColor: const Color(0xFF0D1B3E),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF5311FF),
        onPressed: () async {
          TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (picked != null) {
            final now = DateTime.now();
            homeController.addAlarm(
              DateTime(
                now.year,
                now.month,
                now.day,
                picked.hour,
                picked.minute,
              ),
            );
          }
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Selected Location",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Obx(
                () => TextField(
                  controller: TextEditingController(
                    text: locationController.currentLocation.value,
                  ),
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "Alarms",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: homeController.alarms.length,
                  itemBuilder: (context, index) {
                    final alarm = homeController.alarms[index];
                    return _buildAlarmTile(alarm, index, homeController);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlarmTile(alarm, index, controller) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.08), 
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Text(
          alarm.time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        
        const Spacer(), 
        Text(
          alarm.date,
          style: const TextStyle(
            color: Colors.white70, 
            fontSize: 14,
          ),
        ),
        
        const SizedBox(width: 20), 

        SizedBox(
          width: 37,
          child: Switch(
            value: alarm.isActive,
            onChanged: (val) => controller.toggleAlarm(index),
            
            activeTrackColor: const Color(0xFF6200EE), 
            // ignore: deprecated_member_use
            activeColor: Colors.white, 
            
            inactiveTrackColor: Colors.white,
            inactiveThumbColor: Colors.black,
            
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            trackOutlineWidth: WidgetStateProperty.all(0),
          ),
        ),
      ],
    ),
  );
}
}
