import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification.dart';

class FirebaseNotifications {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static listen() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("On Message : ${message.data}");
      var id = message.data["id"];
      showLocalNotification(id, message.notification);
    }).onError((e)=>  print("Messaging Error: ${e.toString()}"));
    firebaseMessaging.getInitialMessage().then((message) {
      print("Initial Message : ${message?.data}");
    }).catchError((e)=>  print("Initial Message Error: ${e.toString()}"));
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("On Message Opened App: ${message.data}");
      var id = message.data["id"];
      showLocalNotification(id, message.notification);
    }).onError((e)=>  print("Messaging Error: ${e.toString()}"));
  }

  static init() async {
    await FirebaseMessaging.instance
        .requestPermission(sound: true, badge: true, alert: true)
        .then((settings) =>
            print("Settings registered: ${settings.authorizationStatus}"));
    // print("Fcm Token: ${await FirebaseMessaging.instance.getToken()}");
  }

  static showLocalNotification(
    id,
    RemoteNotification? message,
  ) async {
    if (message != null) {
      final title = message.title;
      final body = message.body;
      if ((title != null && title.isNotEmpty) ||
          (body != null && body.isNotEmpty)) {
        await LocalNotifications.show(
          id: int.tryParse(id.toString()) ?? 100,
          title: title ?? "",
          body: body ?? "",
        );
      }
    }
  }
}
