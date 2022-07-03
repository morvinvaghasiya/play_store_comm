import 'package:awesome_notifications/awesome_notifications.dart';

void Notify() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 1, channelKey: '1', title: "Your All Data Deleted"),
  );
}
