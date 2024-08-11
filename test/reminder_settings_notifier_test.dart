import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/providers/reminder_settings_notifier.dart';

// This will generate a MockSimplifiedNotificationManager class
@GenerateMocks([SimplifiedNotificationManager])
import 'reminder_settings_notifier_test.mocks.dart';

void main() {
  late ReminderSettingsNotifier notifier;
  late MockSimplifiedNotificationManager mockManager;

  setUp(() {
    mockManager = MockSimplifiedNotificationManager();
    notifier = ReminderSettingsNotifier(mockManager);
  });

  group('ReminderSettingsNotifier', () {
    test('initial state is correct', () {
      expect(notifier.state.reminderTime, equals(TimeOfDay(hour: 9, minute: 0)));
      expect(notifier.state.isLifetimeReminder, isFalse);
      expect(notifier.state.easterReminders, equals({
        EasterEventType.ashWednesday: false,
        EasterEventType.palmSunday: false,
        EasterEventType.holyThursday: false,
        EasterEventType.goodFriday: false,
        EasterEventType.holySaturday: false,
        EasterEventType.easterSunday: false,
      }));
      expect(notifier.state.hasDailyReminder, isFalse);
      expect(notifier.state.oneTimeReminderDate, isNull);
    });

    group('setReminderTime', () {
      test('updates reminder time correctly', () {
        notifier.setReminderTime(TimeOfDay(hour: 14, minute: 30));
        expect(notifier.state.reminderTime, equals(TimeOfDay(hour: 14, minute: 30)));
      });

      test('does not affect other state properties', () {
        final initialState = notifier.state;
        notifier.setReminderTime(TimeOfDay(hour: 14, minute: 30));
        expect(notifier.state.isLifetimeReminder, equals(initialState.isLifetimeReminder));
        expect(notifier.state.easterReminders, equals(initialState.easterReminders));
        expect(notifier.state.hasDailyReminder, equals(initialState.hasDailyReminder));
        expect(notifier.state.oneTimeReminderDate, equals(initialState.oneTimeReminderDate));
      });
    });

    group('setLifetimeReminder', () {
      test('updates isLifetimeReminder correctly', () {
        notifier.setLifetimeReminder(true);
        expect(notifier.state.isLifetimeReminder, isTrue);
        notifier.setLifetimeReminder(false);
        expect(notifier.state.isLifetimeReminder, isFalse);
      });

      test('does not affect other state properties', () {
        final initialState = notifier.state;
        notifier.setLifetimeReminder(true);
        expect(notifier.state.reminderTime, equals(initialState.reminderTime));
        expect(notifier.state.easterReminders, equals(initialState.easterReminders));
        expect(notifier.state.hasDailyReminder, equals(initialState.hasDailyReminder));
        expect(notifier.state.oneTimeReminderDate, equals(initialState.oneTimeReminderDate));
      });
    });

    group('setEasterReminder', () {
      test('updates specific Easter reminder correctly', () {
        notifier.setEasterReminder(EasterEventType.ashWednesday, true);
        expect(notifier.state.easterReminders[EasterEventType.ashWednesday], isTrue);
        notifier.setEasterReminder(EasterEventType.ashWednesday, false);
        expect(notifier.state.easterReminders[EasterEventType.ashWednesday], isFalse);
      });

      test('does not affect other Easter reminders', () {
        notifier.setEasterReminder(EasterEventType.ashWednesday, true);
        expect(notifier.state.easterReminders[EasterEventType.palmSunday], isFalse);
        expect(notifier.state.easterReminders[EasterEventType.easterSunday], isFalse);
      });

      test('does not affect other state properties', () {
        final initialState = notifier.state;
        notifier.setEasterReminder(EasterEventType.ashWednesday, true);
        expect(notifier.state.reminderTime, equals(initialState.reminderTime));
        expect(notifier.state.isLifetimeReminder, equals(initialState.isLifetimeReminder));
        expect(notifier.state.hasDailyReminder, equals(initialState.hasDailyReminder));
        expect(notifier.state.oneTimeReminderDate, equals(initialState.oneTimeReminderDate));
      });
    });

    group('setDailyReminder', () {
      test('updates hasDailyReminder correctly', () {
        notifier.setDailyReminder(true);
        expect(notifier.state.hasDailyReminder, isTrue);
        notifier.setDailyReminder(false);
        expect(notifier.state.hasDailyReminder, isFalse);
      });

      test('does not affect other state properties', () {
        final initialState = notifier.state;
        notifier.setDailyReminder(true);
        expect(notifier.state.reminderTime, equals(initialState.reminderTime));
        expect(notifier.state.isLifetimeReminder, equals(initialState.isLifetimeReminder));
        expect(notifier.state.easterReminders, equals(initialState.easterReminders));
        expect(notifier.state.oneTimeReminderDate, equals(initialState.oneTimeReminderDate));
      });
    });

    group('setOneTimeReminder', () {
      test('updates oneTimeReminderDate correctly for future date', () {
        final futureDate = DateTime.now().add(Duration(days: 1));
        notifier.setOneTimeReminder(futureDate);
        expect(notifier.state.oneTimeReminderDate, equals(futureDate));
      });

      test('sets oneTimeReminderDate to null for past date', () {
        final pastDate = DateTime.now().subtract(Duration(days: 1));
        notifier.setOneTimeReminder(pastDate);
        expect(notifier.state.oneTimeReminderDate, isNull);
      });

      test('sets oneTimeReminderDate to null when null is provided', () {
        notifier.setOneTimeReminder(null);
        expect(notifier.state.oneTimeReminderDate, isNull);
      });

      test('does not affect other state properties', () {
        final initialState = notifier.state;
        final futureDate = DateTime.now().add(Duration(days: 1));
        notifier.setOneTimeReminder(futureDate);
        expect(notifier.state.reminderTime, equals(initialState.reminderTime));
        expect(notifier.state.isLifetimeReminder, equals(initialState.isLifetimeReminder));
        expect(notifier.state.easterReminders, equals(initialState.easterReminders));
        expect(notifier.state.hasDailyReminder, equals(initialState.hasDailyReminder));
      });
    });

    group('saveSettings', () {
      test('calls updateSettings on SimplifiedNotificationManager', () async {
        when(mockManager.updateSettings(any)).thenAnswer((_) => Future.value());
        await notifier.saveSettings();
        verify(mockManager.updateSettings(notifier.state)).called(1);
      });

      test('handles errors from SimplifiedNotificationManager', () async {
        when(mockManager.updateSettings(any)).thenThrow(Exception('Test error'));
        expect(() => notifier.saveSettings(), throwsException);
      });
    });
  });
}