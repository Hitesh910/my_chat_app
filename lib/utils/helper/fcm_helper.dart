import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mychat_app/utils/services/notification_services.dart';

class FcmHelper
{
 static FcmHelper helper = FcmHelper._();
  FcmHelper._();

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? token;

  void initialize()
  async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

 Future<void> getToken()
 async
 {
   token = await FirebaseMessaging.instance.getToken();
   print("===========${token}========");
 }

  void receiveData()
  {
    getToken();
    FirebaseMessaging.onMessage.listen((event) {
      if(event.notification!= null)
        {
          String? title = event.notification!.title;
          String? body = event.notification!.body;
          String? image = event.notification!.android!.imageUrl;
print(title);
          if(title !=null && body != null && image==null)
            {
              NotificationServices.notificationServices.showSimpleNotification(title,body);
            }
          else if(title != null && body !=null && image != null)
            {
              NotificationServices.notificationServices.showBigImage(title,body,image);
            }
        }
    },);
  }


}