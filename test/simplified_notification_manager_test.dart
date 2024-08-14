/*
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';
import 'package:reminder_app_v2/data/repositories/notification_repository.dart';
import 'package:reminder_app_v2/data/services/notification_service.dart';

// This will generate mock classes for our dependencies
@GenerateMocks([NotificationService, NotificationRepository])
import 'simplified_notification_manager_test.mocks.dart';

void main() {
  late SimplifiedNotificationManager manager;
  late MockNotificationService mockService;
  late MockNotificationRepository mockRepository;

  setUp(() {
    mockService = MockNotificationService();
    mockRepository = MockNotificationRepository();
    manager = SimplifiedNotificationManager(mockService, mockRepository);
  });

  group('SimplifiedNotificationManager', () {
    group('updateSettings', () {
      test('schedules Easter reminders correctly', () async {
        final settings = UserNotificationSettings(
          reminderTime: const TimeOfDay(hour: 9, minute: 0),
          isLifetimeReminder: true,
          easterReminders: {
            EasterEventType.ashWednesday: true,
            EasterEventType.palmSunday: false,
            EasterEventType.holyThursday: true,
            EasterEventType.goodFriday: false,
            EasterEventType.holySaturday: true,
            EasterEventType.easterSunday: false,
          },
          hasDailyReminder: false,
        );

        when(mockRepository.getAllNotificationSettings())
            .thenAnswer((_) => Future.value([]));
        when(mockService.scheduleNotification(any))
            .thenAnswer((_) => Future.value());
        when(mockRepository.addNotificationSetting(any))
            .thenAnswer((_) => Future.value(1));

        await manager.updateSettings(settings);

        verify(mockService.scheduleNotification(argThat(
            predicate<NotificationSettingModel>((setting) =>
                setting.type == NotificationType.ashWednesday &&
                setting.recurrenceType == RecurrenceType.yearly)))).called(1);

        verify(mockService.scheduleNotification(argThat(
            predicate<NotificationSettingModel>((setting) =>
                setting.type == NotificationType.holyThursday &&
                setting.recurrenceType == RecurrenceType.yearly)))).called(1);

        verify(mockService.scheduleNotification(argThat(
            predicate<NotificationSettingModel>((setting) =>
                setting.type == NotificationType.holySaturday &&
                setting.recurrenceType == RecurrenceType.yearly)))).called(1);

        verifyNever(mockService.scheduleNotification(argThat(
            predicate<NotificationSettingModel>((setting) =>
                setting.type == NotificationType.palmSunday ||
                setting.type == NotificationType.goodFriday ||
                setting.type == NotificationType.easterSunday))));
      });

      test('schedules daily reminder correctly', () async {
        final settings = UserNotificationSettings(
          reminderTime: const TimeOfDay(hour: 9, minute: 0),
          isLifetimeReminder: false,
          easterReminders: {},
          hasDailyReminder: true,
        );

        when(mockRepository.getAllNotificationSettings())
            .thenAnswer((_) => Future.value([]));
        when(mockService.scheduleNotification(any))
            .thenAnswer((_) => Future.value());
        when(mockRepository.addNotificationSetting(any))
            .thenAnswer((_) => Future.value(1));

        await manager.updateSettings(settings);

        verify(mockService.scheduleNotification(argThat(
            predicate<NotificationSettingModel>((setting) =>
                setting.type == NotificationType.recurring &&
                setting.recurrenceType == RecurrenceType.daily)))).called(1);
      });

      test('schedules one-time reminder correctly', () async {
        final oneTimeDate = DateTime.now().add(const Duration(days: 1));
        final settings = UserNotificationSettings(
          reminderTime: const TimeOfDay(hour: 9, minute: 0),
          isLifetimeReminder: false,
          easterReminders: {},
          hasDailyReminder: false,
          oneTimeReminderDate: oneTimeDate,
        );

        when(mockRepository.getAllNotificationSettings())
            .thenAnswer((_) => Future.value([]));
        when(mockService.scheduleNotification(any))
            .thenAnswer((_) => Future.value());
        when(mockRepository.addNotificationSetting(any))
            .thenAnswer((_) => Future.value(1));

        await manager.updateSettings(settings);

        verify(mockService.scheduleNotification(argThat(
            predicate<NotificationSettingModel>((setting) =>
                setting.type == NotificationType.oneTime &&
                setting.dateTime.year == oneTimeDate.year &&
                setting.dateTime.month == oneTimeDate.month &&
                setting.dateTime.day == oneTimeDate.day)))).called(1);
      });

      test('updates settings in correct order',
          () async {
        final existingSettings = [
          NotificationSettingModel(
              id: 1,
              type: NotificationType.recurring,
              dateTime: DateTime.now(),
              recurrenceType: RecurrenceType.daily),
          NotificationSettingModel(
              id: 2,
              type: NotificationType.easterSunday,
              dateTime: DateTime.now(),
              recurrenceType: RecurrenceType.yearly),
        ];

        final newSettings = UserNotificationSettings(
          reminderTime: const TimeOfDay(hour: 9, minute: 0),
          isLifetimeReminder: false,
          easterReminders: {EasterEventType.easterSunday: true},
          hasDailyReminder: false,
        );

        when(mockRepository.getAllNotificationSettings())
            .thenAnswer((_) => Future.value(existingSettings));
        when(mockService.scheduleNotification(any))
            .thenAnswer((_) => Future.value());
        when(mockService.cancelNotification(any))
            .thenAnswer((_) => Future.value());
        when(mockRepository.addNotificationSetting(any))
            .thenAnswer((_) => Future.value(1));

        await manager.updateSettings(newSettings);

        verifyInOrder([
          mockRepository.getAllNotificationSettings(),
          mockService.scheduleNotification(any),
          mockService.cancelNotification(1),
          mockService.cancelNotification(2),
          mockRepository.addNotificationSetting(any),
        ]);
      });

      test('handles errors during notification cancellation', () async {
        final existingSettings = [
          NotificationSettingModel(
              id: 1,
              type: NotificationType.recurring,
              dateTime: DateTime.now(),
              recurrenceType: RecurrenceType.daily),
        ];

        final newSettings = UserNotificationSettings(
          reminderTime: const TimeOfDay(hour: 9, minute: 0),
          isLifetimeReminder: false,
          easterReminders: {},
          hasDailyReminder: false,
        );

        when(mockRepository.getAllNotificationSettings())
            .thenAnswer((_) => Future.value(existingSettings));
        when(mockService.cancelNotification(any))
            .thenThrow(Exception('Cancellation error'));
        when(mockService.scheduleNotification(any))
            .thenAnswer((_) => Future.value());
        when(mockRepository.addNotificationSetting(any))
            .thenAnswer((_) => Future.value(1));

        expect(() => manager.updateSettings(newSettings), throwsException);
      });

      test('handles errors during notification scheduling', () async {
        final newSettings = UserNotificationSettings(
          reminderTime: const TimeOfDay(hour: 9, minute: 0),
          isLifetimeReminder: false,
          easterReminders: {EasterEventType.easterSunday: true},
          hasDailyReminder: false,
        );

        when(mockRepository.getAllNotificationSettings())
            .thenAnswer((_) => Future.value([]));
        when(mockService.scheduleNotification(any))
            .thenThrow(Exception('Scheduling error'));

        expect(() => manager.updateSettings(newSettings), throwsException);
      });
    });
  });
}
*/