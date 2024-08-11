import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';
import 'package:reminder_app_v2/data/repositories/notification_repository.dart';
import 'package:reminder_app_v2/data/services/notification_service.dart';

class SimplifiedNotificationManager {
  final NotificationService _notificationService;
  final NotificationRepository _repository;
  final Logger _logger = Logger('SimplifiedNotificationManager');

  SimplifiedNotificationManager(this._notificationService, this._repository);

  Future<void> updateSettings(UserNotificationSettings settings) async {
    try {
      _logger.info('Starting to update notification settings');

      // Get existing settings
      final existingSettings = await _repository.getAllNotificationSettings();

      // Schedule new notifications
      final newSettings = await _scheduleNewNotifications(settings);

      // If new notifications are successfully scheduled, cancel old ones
      await _cancelExistingNotifications(existingSettings);

      // Save new settings to the repository
      await _saveNewSettings(newSettings);

      _logger.info('Notification settings updated successfully');
    } catch (e) {
      _logger.severe('Error updating notification settings', e);
      // Handle the error (e.g., show an error message to the user)
      rethrow;
    }
  }

  Future<List<NotificationSettingModel>> _scheduleNewNotifications(
      UserNotificationSettings settings) async {
    List<NotificationSettingModel> newSettings = [];

    // Schedule Easter reminders
    for (var entry in settings.easterReminders.entries) {
      if (entry.value) {
        final notificationSetting = NotificationSettingModel(
          type: _mapEasterEventToNotificationType(entry.key),
          dateTime: DateTime.now(), // This will be calculated in the service
          hour: settings.reminderTime.hour,
          minute: settings.reminderTime.minute,
          recurrenceType: settings.isLifetimeReminder
              ? RecurrenceType.yearly
              : RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: true,
          isEnabled: true,
        );
        await _notificationService.scheduleNotification(notificationSetting);
        newSettings.add(notificationSetting);
      }
    }

    // Schedule daily reminder
    if (settings.hasDailyReminder) {
      final notificationSetting = NotificationSettingModel(
        type: NotificationType.recurring,
        dateTime: DateTime.now(),
        hour: settings.reminderTime.hour,
        minute: settings.reminderTime.minute,
        recurrenceType: RecurrenceType.daily,
        recurrenceInterval: 1,
        isEasterRelated: false,
        isEnabled: true,
      );
      await _notificationService.scheduleNotification(notificationSetting);
      newSettings.add(notificationSetting);
    }

    // Schedule one-time reminder
    if (settings.oneTimeReminderDate != null) {
      final notificationSetting = NotificationSettingModel(
        type: NotificationType.oneTime,
        dateTime: settings.oneTimeReminderDate!,
        hour: settings.reminderTime.hour,
        minute: settings.reminderTime.minute,
        recurrenceType: RecurrenceType.none,
        recurrenceInterval: 1,
        isEasterRelated: false,
        isEnabled: true,
      );
      await _notificationService.scheduleNotification(notificationSetting);
      newSettings.add(notificationSetting);
    }

    return newSettings;
  }

  Future<void> _cancelExistingNotifications(
      List<NotificationSettingModel> existingSettings) async {
    for (var setting in existingSettings) {
      await _notificationService.cancelNotification(setting.id);
      _logger.fine('Cancelled notification: ${setting.id}');
    }
  }

  Future<void> _saveNewSettings(
      List<NotificationSettingModel> newSettings) async {
    for (var setting in newSettings) {
      await _repository.addNotificationSetting(setting);
      _logger.fine('Saved new notification setting: ${setting.id}');
    }
  }

  NotificationType _mapEasterEventToNotificationType(EasterEventType event) {
    switch (event) {
      case EasterEventType.ashWednesday:
        return NotificationType.ashWednesday;
      case EasterEventType.palmSunday:
        return NotificationType.palmSunday;
      case EasterEventType.holyThursday:
        return NotificationType.holyThursday;
      case EasterEventType.goodFriday:
        return NotificationType.goodFriday;
      case EasterEventType.holySaturday:
        return NotificationType.holySaturday;
      case EasterEventType.easterSunday:
        return NotificationType.easterSunday;
    }
  }
}

class UserNotificationSettings {
  final TimeOfDay reminderTime;
  final bool isLifetimeReminder;
  final Map<EasterEventType, bool> easterReminders;
  final bool hasDailyReminder;
  final DateTime? oneTimeReminderDate;

  UserNotificationSettings({
    required this.reminderTime,
    required this.isLifetimeReminder,
    required this.easterReminders,
    required this.hasDailyReminder,
    this.oneTimeReminderDate,
  });

  factory UserNotificationSettings.initial() {
    return UserNotificationSettings(
      reminderTime: const TimeOfDay(hour: 9, minute: 0),
      isLifetimeReminder: false,
      easterReminders: {
        EasterEventType.ashWednesday: false,
        EasterEventType.palmSunday: false,
        EasterEventType.holyThursday: false,
        EasterEventType.goodFriday: false,
        EasterEventType.holySaturday: false,
        EasterEventType.easterSunday: false,
      },
      hasDailyReminder: false,
    );
  }

  UserNotificationSettings copyWith({
    TimeOfDay? reminderTime,
    bool? isLifetimeReminder,
    Map<EasterEventType, bool>? easterReminders,
    bool? hasDailyReminder,
    DateTime? oneTimeReminderDate,
  }) {
    return UserNotificationSettings(
      reminderTime: reminderTime ?? this.reminderTime,
      isLifetimeReminder: isLifetimeReminder ?? this.isLifetimeReminder,
      easterReminders: easterReminders ?? this.easterReminders,
      hasDailyReminder: hasDailyReminder ?? this.hasDailyReminder,
      oneTimeReminderDate: oneTimeReminderDate ?? this.oneTimeReminderDate,
    );
  }
}

enum EasterEventType {
  ashWednesday,
  palmSunday,
  holyThursday,
  goodFriday,
  holySaturday,
  easterSunday,
}
