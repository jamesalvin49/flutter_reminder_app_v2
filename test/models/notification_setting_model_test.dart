import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';

void main() {
  group('NotificationSettingModel', () {
    group('Constructor and Basic Properties', () {
      test('creates a valid one-time notification', () {
        final oneTime = NotificationSettingModel(
          type: NotificationType.oneTime,
          dateTime: DateTime(2023, 7, 1, 10, 0),
          hour: 10,
          minute: 0,
          recurrenceType: RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        expect(oneTime.type, NotificationType.oneTime);
        expect(oneTime.dateTime, DateTime(2023, 7, 1, 10, 0));
        expect(oneTime.hour, 10);
        expect(oneTime.minute, 0);
        expect(oneTime.recurrenceType, RecurrenceType.none);
        expect(oneTime.isEasterRelated, false);
        expect(oneTime.isEnabled, true);
      });

      test('creates a valid recurring notification', () {
        final recurring = NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 9, 0),
          hour: 9,
          minute: 0,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        expect(recurring.type, NotificationType.recurring);
        expect(recurring.dateTime, DateTime(2023, 7, 1, 9, 0));
        expect(recurring.hour, 9);
        expect(recurring.minute, 0);
        expect(recurring.recurrenceType, RecurrenceType.daily);
        expect(recurring.recurrenceInterval, 1);
        expect(recurring.isEasterRelated, false);
        expect(recurring.isEnabled, true);
      });

      test('creates a valid Easter-related notification', () {
        final easterRelated = NotificationSettingModel(
          type: NotificationType.easterSunday,
          dateTime: DateTime(2023, 4, 9, 8, 0),
          hour: 8,
          minute: 0,
          recurrenceType: RecurrenceType.yearly,
          recurrenceInterval: 1,
          isEasterRelated: true,
          isEnabled: true,
        );

        expect(easterRelated.type, NotificationType.easterSunday);
        expect(easterRelated.dateTime, DateTime(2023, 4, 9, 8, 0));
        expect(easterRelated.hour, 8);
        expect(easterRelated.minute, 0);
        expect(easterRelated.recurrenceType, RecurrenceType.yearly);
        expect(easterRelated.isEasterRelated, true);
        expect(easterRelated.isEnabled, true);
      });
    });

    group('Edge Cases and Validation', () {
      test('handles midnight (00:00) correctly', () {
        final midnight = NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 0, 0),
          hour: 0,
          minute: 0,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        expect(midnight.hour, 0);
        expect(midnight.minute, 0);
      });

      test('handles last minute of the day (23:59) correctly', () {
        final lastMinute = NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 23, 59),
          hour: 23,
          minute: 59,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        expect(lastMinute.hour, 23);
        expect(lastMinute.minute, 59);
      });

      test('throws ArgumentError for invalid hour', () {
        expect(() => NotificationSettingModel(
          type: NotificationType.oneTime,
          dateTime: DateTime(2023, 7, 1, 24, 0),
          hour: 24,
          minute: 0,
          recurrenceType: RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        ), throwsArgumentError);
      });

      test('throws ArgumentError for invalid minute', () {
        expect(() => NotificationSettingModel(
          type: NotificationType.oneTime,
          dateTime: DateTime(2023, 7, 1, 12, 60),
          hour: 12,
          minute: 60,
          recurrenceType: RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        ), throwsArgumentError);
      });

      test('throws ArgumentError for invalid recurrence interval', () {
        expect(() => NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 12, 0),
          hour: 12,
          minute: 0,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 0,
          isEasterRelated: false,
          isEnabled: true,
        ), throwsArgumentError);
      });
    });

    group('copyWith Method', () {
      test('creates a new instance with updated values', () {
        final original = NotificationSettingModel(
          type: NotificationType.oneTime,
          dateTime: DateTime(2023, 7, 1, 10, 0),
          hour: 10,
          minute: 0,
          recurrenceType: RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        final copied = original.copyWith(
          type: NotificationType.recurring,
          recurrenceType: RecurrenceType.daily,
          isEnabled: false,
        );
        copied.updateTimeOfDay(const TimeOfDay(hour: 9, minute: 30));

        expect(copied.type, NotificationType.recurring);
        expect(copied.dateTime, original.dateTime); // Should remain the same
        expect(copied.hour, 9);
        expect(copied.minute, 30);
        expect(copied.recurrenceType, RecurrenceType.daily);
        expect(copied.isEasterRelated, original.isEasterRelated); // Should remain the same
        expect(copied.isEnabled, false);
      });

      test('returns the same instance if no parameters are passed', () {
        final original = NotificationSettingModel(
          type: NotificationType.oneTime,
          dateTime: DateTime(2023, 7, 1, 10, 0),
          hour: 10,
          minute: 0,
          recurrenceType: RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        final copied = original.copyWith();
        expect(identical(original, copied), isTrue);
      });
    });

    group('TimeOfDay Methods', () {
      test('toTimeOfDay returns correct TimeOfDay', () {
        final notification = NotificationSettingModel(
          type: NotificationType.oneTime,
          dateTime: DateTime(2023, 7, 1, 14, 30),
          hour: 14,
          minute: 30,
          recurrenceType: RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        final timeOfDay = notification.toTimeOfDay();
        expect(timeOfDay.hour, 14);
        expect(timeOfDay.minute, 30);
      });

      test('updateTimeOfDay updates hour and minute correctly', () {
        final notification = NotificationSettingModel(
          type: NotificationType.oneTime,
          dateTime: DateTime(2023, 7, 1, 10, 0),
          hour: 10,
          minute: 0,
          recurrenceType: RecurrenceType.none,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        notification.updateTimeOfDay(TimeOfDay(hour: 15, minute: 45));
        expect(notification.hour, 15);
        expect(notification.minute, 45);
      });
    });

    group('Equality and Hashcode', () {
      test('equal instances have the same hashcode', () {
        final notification1 = NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 9, 0),
          hour: 9,
          minute: 0,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        final notification2 = NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 9, 0),
          hour: 9,
          minute: 0,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        expect(notification1, equals(notification2));
        expect(notification1.hashCode, equals(notification2.hashCode));
      });

      test('non-equal instances have different hashcodes', () {
        final notification1 = NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 9, 0),
          hour: 9,
          minute: 0,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        final notification2 = NotificationSettingModel(
          type: NotificationType.recurring,
          dateTime: DateTime(2023, 7, 1, 10, 0),
          hour: 10,
          minute: 0,
          recurrenceType: RecurrenceType.daily,
          recurrenceInterval: 1,
          isEasterRelated: false,
          isEnabled: true,
        );

        expect(notification1, isNot(equals(notification2)));
        expect(notification1.hashCode, isNot(equals(notification2.hashCode)));
      });
    });
  });
}