import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationVerifier {
  static Future<List<NotificationModel>> getPendingNotifications() async {
    return await AwesomeNotifications().listScheduledNotifications();
  }

  static Future<void> printPendingNotifications() async {
    final pendingNotifications = await getPendingNotifications();
    print('Pending Notifications:');
    for (var notification in pendingNotifications) {
      print('ID: ${notification.content?.id}, Title: ${notification.content?.title}, Body: ${notification.content?.body}');
      print('Schedule: ${notification.schedule?.toMap()}');
      print('---');
    }
  }

  static Future<bool> isNotificationScheduled(int notificationId) async {
    final pendingNotifications = await getPendingNotifications();
    return pendingNotifications.any((notification) => notification.content?.id == notificationId);
  }
}