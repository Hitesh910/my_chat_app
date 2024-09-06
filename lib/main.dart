import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat_app/utils/app_routes.dart';
import 'package:mychat_app/utils/helper/fcm_helper.dart';
import 'package:mychat_app/utils/services/notification_services.dart';

import 'firebase_options.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationServices.notificationServices.initialize();
  tz.initializeTimeZones();
  FcmHelper.helper.receiveData();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  );
}
