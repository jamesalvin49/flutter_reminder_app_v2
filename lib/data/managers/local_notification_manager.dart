import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reminder_app_v2/utils/app_config.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

/// Manages local notifications using the awesome_notifications package.
class LocalNotificationManager {
  final Logger _logger = Logger('LocalNotificationManager');

  /// Requests notification permissions from the user.
  Future<bool> requestPermissions() async {
    try {
      final isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
      _logger.info('Notification permissions granted: $isAllowed');
      return isAllowed;
    } catch (e) {
      _logger.severe('Error requesting notification permissions', e);
      throw NotificationException(
          'Failed to request notification permissions: ${e.toString()}');
    }
  }

  /// Creates a one-time notification.
  Future<void> createOneTimeNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required int hour,
    required int minute,
    String? payload,
  }) async {
    try {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: AppConfig.oneTimeChannel,
          title: title,
          body: body,
          payload: payload != null ? {'data': payload} : null,
          notificationLayout: NotificationLayout.Default,
        ),
        schedule: NotificationCalendar(
          year: scheduledDate.year,
          month: scheduledDate.month,
          day: scheduledDate.day,
          hour: hour,
          minute: minute,
          second: 0,
          millisecond: 0,
          repeats: false,
          allowWhileIdle: true,
          preciseAlarm: true,
        ),
      );
      _logger.info(
          'One-time notification scheduled: ID $id for ${scheduledDate.toIso8601String()}');
    } catch (e) {
      _logger.severe('Error scheduling one-time notification', e);
      throw NotificationException(
          'Failed to schedule one-time notification: ${e.toString()}');
    }
  }

  /// Creates a daily notification.
  Future<void> createDailyNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
    String? payload,
  }) async {
    try {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: AppConfig.dailyReminderChannel,
          title: title,
          body: body,
          payload: payload != null ? {'data': payload} : null,
        ),
        schedule: NotificationCalendar(
          hour: time.hour,
          minute: time.minute,
          repeats: true,
        ),
      );
      _logger.info(
          'Daily notification scheduled: ID $id at ${time.format(await _getContext())}');
    } catch (e) {
      _logger.severe('Error scheduling daily notification', e);
      rethrow;
    }
  }

  /// Creates a weekly notification.
  Future<void> createWeeklyNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
    required List<int> weekdays,
    String? payload,
  }) async {
    try {
      for (int weekday in weekdays) {
        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: id + weekday, // Unique ID for each day
            channelKey: AppConfig.weeklyReminderChannel,
            title: title,
            body: body,
            payload: payload != null ? {'data': payload} : null,
          ),
          schedule: NotificationCalendar(
            weekday: weekday,
            hour: time.hour,
            minute: time.minute,
            repeats: true,
          ),
        );
      }
      _logger.info(
          'Weekly notification scheduled: ID $id at ${time.format(await _getContext())} on days ${weekdays.join(", ")}');
    } catch (e) {
      _logger.severe('Error scheduling weekly notification', e);
      rethrow;
    }
  }

  /// Creates a monthly notification.
  Future<void> createMonthlyNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
    required int dayOfMonth,
    String? payload,
  }) async {
    try {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: AppConfig.monthlyReminderChannel,
          title: title,
          body: body,
          payload: payload != null ? {'data': payload} : null,
        ),
        schedule: NotificationCalendar(
          day: dayOfMonth,
          hour: time.hour,
          minute: time.minute,
          repeats: true,
        ),
      );
      _logger.info(
          'Monthly notification scheduled: ID $id on day $dayOfMonth at ${time.format(await _getContext())}');
    } catch (e) {
      _logger.severe('Error scheduling monthly notification', e);
      rethrow;
    }
  }

  /// Creates a yearly notification.
  Future<void> createYearlyNotification({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
    String? payload,
  }) async {
    try {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: AppConfig.yearlyReminderChannel,
          title: title,
          body: body,
          payload: payload != null ? {'data': payload} : null,
        ),
        schedule: NotificationCalendar(
          month: dateTime.month,
          day: dateTime.day,
          hour: dateTime.hour,
          minute: dateTime.minute,
          repeats: true,
        ),
      );
      _logger.info(
          'Yearly notification scheduled: ID $id on ${dateTime.toString()}');
    } catch (e) {
      _logger.severe('Error scheduling yearly notification', e);
      rethrow;
    }
  }

  /// Creates an Easter-related notification.
  Future<void> createEasterNotification({
    required int id,
    required String title,
    required String body,
    required DateTime easterDate,
    required int daysOffset,
    String? payload,
  }) async {
    try {
      DateTime notificationDate = easterDate.add(Duration(days: daysOffset));
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: AppConfig.easterChannel,
          title: title,
          body: body,
          payload: payload != null ? {'data': payload} : null,
        ),
        schedule: NotificationCalendar.fromDate(date: notificationDate),
      );
      _logger.info(
          'Easter-related notification scheduled: ID $id for ${notificationDate.toIso8601String()}');
    } catch (e) {
      _logger.severe('Error scheduling Easter-related notification', e);
      rethrow;
    }
  }

  /// Cancels a scheduled notification.
  Future<void> cancelNotification(int id) async {
    try {
      await AwesomeNotifications().cancel(id);
      _logger.info('Notification cancelled: ID $id');
    } catch (e) {
      _logger.severe('Error cancelling notification', e);
      throw NotificationException(
          'Failed to cancel notification: ${e.toString()}');
    }
  }

  /// Cancels all scheduled notifications.
  Future<void> cancelAllNotifications() async {
    try {
      await AwesomeNotifications().cancelAll();
      _logger.info('All notifications cancelled');
    } catch (e) {
      _logger.severe('Error cancelling all notifications', e);
      throw NotificationException(
          'Failed to cancel all notifications: ${e.toString()}');
    }
  }

  /// Checks if a notification with the given ID is scheduled.
  Future<bool> isNotificationScheduled(int id) async {
    try {
      final List<NotificationModel> scheduledNotifications =
          await AwesomeNotifications().listScheduledNotifications();
      bool isScheduled = scheduledNotifications
          .any((notification) => notification.content?.id == id);
      _logger.info('Checked if notification ID $id is scheduled: $isScheduled');
      return isScheduled;
    } catch (e) {
      _logger.severe('Error checking if notification is scheduled', e);
      rethrow;
    }
  }

  /// Sets up notification action listeners.
  void setNotificationListeners({
    required Future<void> Function(ReceivedNotification) onNotificationCreated,
    required Future<void> Function(ReceivedNotification)
        onNotificationDisplayed,
    required Future<void> Function(ReceivedAction) onDismissActionReceived,
    required Future<void> Function(ReceivedAction) onActionReceived,
  }) {
    AwesomeNotifications().setListeners(
      onNotificationCreatedMethod: onNotificationCreated,
      onNotificationDisplayedMethod: onNotificationDisplayed,
      onDismissActionReceivedMethod: onDismissActionReceived,
      onActionReceivedMethod: onActionReceived,
    );
  }

  /// Helper method to get the current context.
  Future<BuildContext> _getContext() async {
    BuildContext context = WidgetsBinding.instance.rootElement!;
    return context;
  }

  Future<void> testImmediateNotification() async {
    try {
      bool success = await AwesomeNotifications().createNotification(
        
        content: NotificationContent(
          id: 0,
          channelKey: AppConfig.oneTimeChannel,
          title: 'Test Notification',
          body: 'This is a test notification',
        ),
      );
      if (success) {
        _logger.info('Test notification created successfully');
      } else {
        _logger.warning('Failed to create test notification');
      }
    } catch (e) {
      _logger.severe('Error creating test notification', e);
    }
  }
}
