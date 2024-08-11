import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/providers/notification_providers.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

class ReminderSettingsNotifier extends StateNotifier<UserNotificationSettings> {
  final SimplifiedNotificationManager _manager;

  ReminderSettingsNotifier(this._manager)
      : super(UserNotificationSettings.initial());

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

  void setOneTimeReminder(DateTime? date) {
    if (date != null && date.isAfter(DateTime.now())) {
      state = state.copyWith(oneTimeReminderDate: date);
    } else {
      state = state.copyWith(oneTimeReminderDate: null);
    }
  }

  Future<void> saveSettings() async {
    try {
      await _manager.updateSettings(state);
    } catch (e) {
      throw NotifierException(
          'Error saving settings: $e');
    }
  }
}

final reminderSettingsProvider =
    StateNotifierProvider<ReminderSettingsNotifier, UserNotificationSettings>(
        (ref) {
  final manager = ref.watch(simplifiedNotificationManagerProvider);
  return ReminderSettingsNotifier(manager);
});
