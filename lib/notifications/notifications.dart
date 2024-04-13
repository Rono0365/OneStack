import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Ninotify {
  static final notify = FlutterLocalNotificationsPlugin();
  

  static Future _notificationDetails() async {
    return  NotificationDetails(
      
        android: AndroidNotificationDetails('channel id', 'channel name',channelDescription:"Your description",
      //sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        icon:"@mipmap/ic_launcher",
        importance: Importance.max
        ),
        iOS: IOSNotificationDetails());
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      notify.show(
        id,
        title,
        body,
        await  _notificationDetails(),
           payload: payload,
           
      );
}
