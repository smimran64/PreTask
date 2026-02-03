import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:sva_task/features/home/model/alerm_model.dart';

class HomeController extends GetxController {
  var alarms = <AlarmModel>[].obs;
  final storage = GetStorage(); 
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _loadAlarmsFromStorage();
    _initializeNotifications();
  }
  void _loadAlarmsFromStorage() {
    List? storedAlarms = storage.read<List>('alarms');
    if (storedAlarms != null) {
      alarms.assignAll(
        storedAlarms.map((data) => AlarmModel.fromJson(data)).toList(),
      );
    }
  }

  // Local Storage-e data save kora

  void _saveAlarmsToStorage() {
    List<Map<String, dynamic>> dataToStore = alarms
        .map((e) => e.toJson())
        .toList();
    storage.write('alarms', dataToStore);
  }

  void addAlarm(DateTime dateTime) {
    int hour = dateTime.hour > 12
        ? dateTime.hour - 12
        : (dateTime.hour == 0 ? 12 : dateTime.hour);
    String period = dateTime.hour >= 12 ? 'pm' : 'am';
    String formattedTime =
        "$hour:${dateTime.minute.toString().padLeft(2, '0')} $period";
    String formattedDate = "Fri ${dateTime.day} Mar ${dateTime.year}";
    alarms.add(
      AlarmModel(time: formattedTime, date: formattedDate, isActive: true),
    );

    _saveAlarmsToStorage();
    _scheduleNotification(dateTime);
  }

  void toggleAlarm(int index) {
    alarms[index].isActive = !alarms[index].isActive;
    alarms.refresh();
    _saveAlarmsToStorage(); 
  }

  void deleteAlarm(int index) {
    alarms.removeAt(index);
    _saveAlarmsToStorage(); 
  }

  // Notification Initialization & Logic 

  void _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _notificationsPlugin.initialize(
      const InitializationSettings(android: android),
    );

    
    final androidImplementation = _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidImplementation?.requestNotificationsPermission();
  }

  void _scheduleNotification(DateTime scheduledTime) async {
    try {
      await _notificationsPlugin.zonedSchedule(
        DateTime.now().millisecondsSinceEpoch % 100000,
        'Travel Alarm',
        'Wake up! Your trip is about to start.',
        tz.TZDateTime.from(scheduledTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'alarm_id',
            'Alarm Channel',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } catch (e) {
      // ignore: avoid_print
      print("Notification Scheduling Error: $e");
    }
  }
}
