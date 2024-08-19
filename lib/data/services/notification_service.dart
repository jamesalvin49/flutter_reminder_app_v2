import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reminder_app_v2/core/service_locator.dart';
import 'package:reminder_app_v2/data/managers/local_notification_manager.dart';
import 'package:reminder_app_v2/data/models/easter_date_calculator.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';
import 'package:reminder_app_v2/data/repositories/notification_repository.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

/// Service for managing and scheduling notifications based on settings.
class NotificationService {
  final NotificationRepository _repository;
  final LocalNotificationManager _notificationManager;
  final Logger _logger = Logger('NotificationService');

  /// Creates a new instance of [NotificationService].
  NotificationService()
      : _repository = getIt<NotificationRepository>(),
        _notificationManager = getIt<LocalNotificationManager>();

  /// Schedules a notification based on the provided [NotificationSettingModel].
  Future<void> scheduleNotification(NotificationSettingModel setting) async {
    try {
      if (!setting.isEnabled) {
        _logger.info(
            'Notification ${setting.id} is disabled. Skipping scheduling.');
        return;
      }

      switch (setting.type) {
        case NotificationType.oneTime:
          await _scheduleOneTimeNotification(setting);
          break;
        case NotificationType.recurring:
          await _scheduleRecurringNotification(setting);
          break;
        case NotificationType.easterDaily:
        case NotificationType.ashWednesday:
        case NotificationType.palmSunday:
        case NotificationType.holyThursday:
        case NotificationType.goodFriday:
        case NotificationType.holySaturday:
        case NotificationType.easterSunday:
          await _scheduleEasterRelatedNotification(setting);
          break;
        default:
          throw InvalidNotificationSettingException(
              'Invalid notification type: ${setting.type}');
      }

      _logger.info('Scheduled notification ${setting.notificationID}');
    } catch (e) {
      _logger.severe('Error scheduling notification', e);
      throw NotificationException(
          'Failed to schedule notification: ${e.toString()}');
    }
  }

  Future<void> _scheduleOneTimeNotification(
      NotificationSettingModel setting) async {
    await _notificationManager.createOneTimeNotification(
      id: setting.notificationID,
      title: _getNotificationTitle(setting),
      body: _getNotificationBody(setting),
      scheduledDate: setting.dateTime,
      hour: setting.hour,
      minute: setting.minute,
      payload: setting.id.toString(),
    );
  }

  Future<void> _scheduleRecurringNotification(
      NotificationSettingModel setting) async {
    switch (setting.recurrenceType) {
      case RecurrenceType.daily:
        await _notificationManager.createDailyNotification(
          id: setting.notificationID,
          title: _getNotificationTitle(setting),
          body: _getNotificationBody(setting),
          time: TimeOfDay(hour: setting.hour, minute: setting.minute),
          payload: setting.id.toString(),
        );
        break;
      case RecurrenceType.weekly:
        await _notificationManager.createWeeklyNotification(
          id: setting.notificationID,
          title: _getNotificationTitle(setting),
          body: _getNotificationBody(setting),
          time: TimeOfDay(hour: setting.hour, minute: setting.minute),
          weekdays: setting.weekdays ?? [],
          payload: setting.id.toString(),
        );
        break;
      case RecurrenceType.monthly:
        await _notificationManager.createMonthlyNotification(
          id: setting.notificationID,
          title: _getNotificationTitle(setting),
          body: _getNotificationBody(setting),
          time: TimeOfDay(hour: setting.hour, minute: setting.minute),
          dayOfMonth: setting.dayOfMonth ?? 1,
          payload: setting.id.toString(),
        );
        break;
      case RecurrenceType.yearly:
        await _notificationManager.createYearlyNotification(
          id: setting.notificationID,
          title: _getNotificationTitle(setting),
          body: _getNotificationBody(setting),
          dateTime: DateTime(
            DateTime.now().year,
            setting.monthOfYear ?? 1,
            setting.dayOfMonth ?? 1,
            setting.hour,
            setting.minute,
          ),
          payload: setting.id.toString(),
        );
        break;
      case RecurrenceType.none:
        _logger.warning(
            'Recurring notification with RecurrenceType.none. Skipping.');
        break;
    }
  }

  Future<void> _scheduleEasterRelatedNotification(
      NotificationSettingModel setting) async {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    int targetYear = currentYear;

    // If it's after Easter this year, schedule for next year
    EasterDateCalculator? currentYearEaster =
        await _repository.getEasterDateByYear(currentYear);
    if (currentYearEaster != null &&
        now.isAfter(currentYearEaster.easterSunday)) {
      targetYear = currentYear + 1;
    }

    EasterDateCalculator? easterDate =
        await _repository.getEasterDateByYear(targetYear);
    if (easterDate == null) {
      // Calculate and store Easter date if not available
      DateTime calculatedEasterSunday =
          EasterDateCalculator.calculateEasterSunday(targetYear);
      easterDate = EasterDateCalculator(
          year: targetYear, easterSunday: calculatedEasterSunday);
      await _repository.addEasterDate(easterDate);
    }

    DateTime notificationDate;
    switch (setting.type) {
      case NotificationType.ashWednesday:
        notificationDate = easterDate.ashWednesday;
        break;
      case NotificationType.palmSunday:
        notificationDate = easterDate.palmSunday;
        break;
      case NotificationType.holyThursday:
        notificationDate = easterDate.holyThursday;
        break;
      case NotificationType.goodFriday:
        notificationDate = easterDate.goodFriday;
        break;
      case NotificationType.holySaturday:
        notificationDate = easterDate.holySaturday;
        break;
      case NotificationType.easterSunday:
        notificationDate = easterDate.easterSunday;
        break;
      case NotificationType.easterDaily:
        // Schedule for each day of Holy Week
        for (var date in [
          easterDate.palmSunday,
          easterDate.holyThursday,
          easterDate.goodFriday,
          easterDate.holySaturday,
          easterDate.easterSunday,
        ]) {
          await _scheduleSpecificEasterNotification(
            setting,
            easterDate,
            date.difference(easterDate.easterSunday).inDays,
          );
        }
        return;
      default:
        throw ArgumentError('Invalid Easter-related notification type');
    }
    await _scheduleSpecificEasterNotification(
      setting,
      easterDate,
      notificationDate.difference(easterDate.easterSunday).inDays,
    );
  }

  Future<void> _scheduleSpecificEasterNotification(
      NotificationSettingModel setting,
      EasterDateCalculator easterDate,
      int daysOffset) async {
    DateTime notificationDate =
        easterDate.easterSunday.add(Duration(days: daysOffset));

    // Only schedule if the date is in the future
    if (notificationDate.isAfter(DateTime.now())) {
      await _notificationManager.createEasterNotification(
        id: setting.notificationID, //+ daysOffset, // Unique ID for each day
        title: _getNotificationTitle(setting),
        body: _getNotificationBody(setting),
        easterDate: easterDate.easterSunday,
        daysOffset: daysOffset,
        payload: setting.id.toString(),
      );
      _logger.info(
          'Scheduled Easter notification for ${notificationDate.toIso8601String()} (offset: $daysOffset)');
    } else {
      _logger.info(
          'Skipped scheduling past notification for ${notificationDate.toIso8601String()} (offset: $daysOffset)');
    }
  }

  /// Cancels a scheduled notification.
  Future<void> cancelNotification(int id) async {
    try {
      await _notificationManager.cancelNotification(id);
      _logger.info('Cancelled notification $id');
    } catch (e) {
      _logger.severe('Error cancelling notification', e);
      rethrow;
    }
  }

  /// Cancels a all notification.
  Future<void> cancelAllNotifications() async {
    try {
      await _notificationManager.cancelAllNotifications();
      _logger.info('Cancelled all notification');
    } catch (e) {
      _logger.severe('Error cancelling notification', e);
      rethrow;
    }
  }

  /// Reschedules all active notifications.
  Future<void> rescheduleAllNotifications() async {
    try {
      var settings = await _repository.getActiveNotificationSettings();
      for (var setting in settings) {
        await scheduleNotification(setting);
      }
      _logger.info('Rescheduled all active notifications');
    } catch (e) {
      _logger.severe('Error rescheduling all notifications', e);
      rethrow;
    }
  }

  /// Generates a title for the notification based on its type.
  String _getNotificationTitle(NotificationSettingModel setting) {
    switch (setting.type) {
      case NotificationType.oneTime:
        return 'One-time Reminder';
      case NotificationType.recurring:
        return 'Recurring Reminder';
      case NotificationType.easterDaily:
        return 'Holy Week Reminder';
      case NotificationType.ashWednesday:
        return 'Ash Wednesday Reminder';
      case NotificationType.palmSunday:
        return 'Palm Sunday Reminder';
      case NotificationType.holyThursday:
        return 'Holy Thursday Reminder';
      case NotificationType.goodFriday:
        return 'Good Friday Reminder';
      case NotificationType.holySaturday:
        return 'Holy Saturday Reminder';
      case NotificationType.easterSunday:
        return 'Easter Sunday Reminder';
    }
  }

  /// Generates a body text for the notification based on its type.
  String _getNotificationBody(NotificationSettingModel setting) {
    // Implement logic to generate appropriate body text
    return 'Your reminder for ${setting.type.toString().split('.').last}';
  }

  Future<void> testImmediateNotification() async {
    await _notificationManager.testImmediateNotification();
  }
}
