import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_app_v2/core/service_locator.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/providers/notification_providers.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

class ReminderSettingsNotifier extends StateNotifier<UserNotificationSettings> {
  final SimplifiedNotificationManager _manager =
      getIt<SimplifiedNotificationManager>();

  ReminderSettingsNotifier() : super(UserNotificationSettings.initial()) {
    loadInitialSettings();
  }

  Future<void> loadInitialSettings() async {
    try {
      final settings = await _manager.getSettings();
      state = settings;
    } catch (e) {
      // If there's an error loading settings, we'll keep the initial state
      // You might want to log this error or handle it in some way
      print('Error loading initial settings: $e');
    }
  }

  void setReminderTime(TimeOfDay time) {
    state = state.copyWith(reminderTime: time);
  }

  void setLifetimeReminder(bool value) {
    state = state.copyWith(isLifetimeReminder: value);
  }

  void setEasterReminder(EasterEventType event, bool value) {
    final newEasterReminders =
        Map<EasterEventType, bool>.from(state.easterReminders);
    newEasterReminders[event] = value;
    state = state.copyWith(easterReminders: newEasterReminders);
  }

  void setDailyReminder(bool value) {
    state = state.copyWith(hasDailyReminder: value);
  }

  String? setOneTimeReminder(DateTime? date) {
    if (date != null) {
      final now = DateTime.now();
      final reminderDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        state.reminderTime.hour,
        state.reminderTime.minute,
      );

      if (reminderDateTime.isBefore(now)) {
        return "Cannot set a reminder for a past date and time.";
      }

      state = state.copyWith(oneTimeReminderDate: date);
    } else {
      state = state.copyWith(
        oneTimeReminderDate: null,
        clearOneTimeReminderDate: true,
      );
    }

    return null; // No error
  }

  Future<void> saveSettings() async {
    try {
      await _manager.updateSettings(state);
    } catch (e) {
      throw NotifierException('Error saving settings: $e');
    }
  }

  Future<void> testImmediateNotification() async {
    try {
      await _manager.testImmediateNotification();
    } catch (e) {
      throw NotifierException('Error creating test notification: $e');
    }
  }
}
