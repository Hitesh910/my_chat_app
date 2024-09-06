import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:http/http.dart' as http;

class NotificationServices {
  static NotificationServices notificationServices = NotificationServices._();

  NotificationServices._();

  // FlutterLocalNotificationsPlugin();
  FlutterLocalNotificationsPlugin flutterLocalNotificationPlugins =
      FlutterLocalNotificationsPlugin();

  void initialize() {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("notification");
    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    flutterLocalNotificationPlugins.initialize(initializationSettings);
  }

  void showSimpleNotification(String title,String body) {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("1", "Simple",
            importance: Importance.max, priority: Priority.high);
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    flutterLocalNotificationPlugins.show(
        1, "${title}", "${body}", notificationDetails);
  }

  void showSchedualNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("2", "Schedual");
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    flutterLocalNotificationPlugins.zonedSchedule(
        2,
        "5 second",
        "Message",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<Uint8List> getLink(String link) async {
    var responces = await http.get(Uri.parse(link));
    return responces.bodyBytes;
  }

  void showBigImage(String title,String body,String image) async {
    String link =
        "${image}";
    var byte = await getLink(link);
    // BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(FilePathAndroidBitmap(link));

    ByteArrayAndroidBitmap byteArrayAndroidBitmap =
        ByteArrayAndroidBitmap(byte);

    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(byteArrayAndroidBitmap);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("4", "Big Picture",
            styleInformation: bigPictureStyleInformation);

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    flutterLocalNotificationPlugins.zonedSchedule(
        4,
        "${title}",
        "${body}",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void showMediaNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("5", "Sound",
            importance: Importance.max,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound("message"),
            playSound: true);
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    flutterLocalNotificationPlugins.show(
        5, "Sound", "Sound notification", notificationDetails);
  }
}
