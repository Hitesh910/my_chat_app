import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationServices
{
  static NotificationServices  notificationServices = NotificationServices._();
  NotificationServices._();
  // FlutterLocalNotificationsPlugin();
  FlutterLocalNotificationsPlugin flutterLocalNotificationPlugins = FlutterLocalNotificationsPlugin();
  
  void initialize()
  {
    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings("logo");
    DarwinInitializationSettings darwinInitializationSettings = const DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings,iOS: darwinInitializationSettings,);
    flutterLocalNotificationPlugins.initialize(initializationSettings);
  }
  
  void showSimpleNotification()
  {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails("1", "Simple",importance: Importance.max,priority: Priority.high);
    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails,iOS: darwinNotificationDetails);
    flutterLocalNotificationPlugins.show(1, "Simple", "Message", notificationDetails);
  }

  Future<void> showSchewdualNotification()
  async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails("2", "Schedual");
    DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails,iOS: darwinNotificationDetails,);
   await flutterLocalNotificationPlugins.zonedSchedule(2, "5 second", "Message", tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)), notificationDetails, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }
}