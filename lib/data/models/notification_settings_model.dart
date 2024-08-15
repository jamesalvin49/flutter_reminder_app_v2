import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:reminder_app_v2/utils/app_config.dart';

part 'notification_settings_model.g.dart';

/// Represents a notification setting in the application.
///
/// This class is used to store and manage various types of notifications,
/// including one-time, recurring, and Easter-related notifications.
@collection
class NotificationSettingModel {
  /// Unique identifier for the notification setting.
  Id id = Isar.autoIncrement;

  /// The type of notification (e.g., one-time, recurring, Easter-related).
  @enumerated
  @Index()
  NotificationType type;

  /// The date and time for one-time notifications or the start date for recurring notifications.
  DateTime dateTime;

  /// The time of day for the notification.
  int hour;
  int minute;

  /// The type of recurrence (e.g., daily, weekly, monthly, yearly).
  @enumerated
  RecurrenceType recurrenceType;

  /// The interval for recurrence (e.g., every 2 days, every 3 weeks).
  int recurrenceInterval;

  /// The days of the week for weekly recurrence (1-7, where 1 is Monday).
  List<int>? weekdays;

  /// The type of monthly recurrence (day of month or day of week).
  @enumerated
  MonthlyRecurrenceType monthlyRecurrenceType;

  /// The day of the month for monthly/yearly recurrence.
  int? dayOfMonth;

  /// The week of the month for monthly/yearly recurrence (1-4 or -1 for last).
  int? weekOfMonth;

  /// The month of the year for yearly recurrence (1-12).
  int? monthOfYear;

  /// The end condition for the recurrence.
  @enumerated
  RecurrenceEnd recurrenceEnd;

  /// The number of times the notification should occur (for specific number of times).
  int? recurrenceCount;

  /// The end date for the recurrence (for until a specific date).
  DateTime? recurrenceEndDate;

  /// Indicates if this is an Easter-related notification.
  bool isEasterRelated;

  /// Indicates if the notification is currently enabled.
  @Index()
  bool isEnabled;

  /// Logger for this class.
  static final _logger = Logger('NotificationSetting');

  /// Creates a new [NotificationSetting] instance.
  ///
  /// Throws an [ArgumentError] if required fields are missing or invalid.
  NotificationSettingModel({
    required this.type,
    required this.dateTime,
    this.hour = AppConfig.defaultReminderHour,
    this.minute = AppConfig.defaultReminderMinute,
    this.recurrenceType = RecurrenceType.none,
    this.recurrenceInterval = 1,
    this.weekdays,
    this.monthlyRecurrenceType = MonthlyRecurrenceType.dayOfMonth,
    this.dayOfMonth,
    this.weekOfMonth,
    this.monthOfYear,
    this.recurrenceEnd = RecurrenceEnd.forever,
    this.recurrenceCount,
    this.recurrenceEndDate,
    this.isEasterRelated = false,
    this.isEnabled = true
  }) {
    _validateFields();
    _logger.info('Created new NotificationSetting: $type');
  }

  /// Validates the fields of the notification setting.
  ///
  /// Throws an [ArgumentError] if any required field is missing or invalid.
  void _validateFields() {
    if (type == NotificationType.oneTime &&
        recurrenceType != RecurrenceType.none) {
      throw ArgumentError(
          'recurrenceType must be none for one-time notifications');
    }
    if (type == NotificationType.recurring &&
        recurrenceType == RecurrenceType.none) {
      throw ArgumentError(
          'recurrenceType must be set for recurring notifications');
    }

    if (recurrenceEnd == RecurrenceEnd.specificNumber &&
        recurrenceCount == null) {
      throw ArgumentError(
          'recurrenceCount must be set when recurrenceEnd is specificNumber');
    }

    if (recurrenceEnd == RecurrenceEnd.untilDate && recurrenceEndDate == null) {
      throw ArgumentError(
          'recurrenceEndDate must be set when recurrenceEnd is untilDate');
    }
    if (hour < 0 || hour > 23) {
      throw ArgumentError('hour must be between 0 and 23');
    }
    if (minute < 0 || minute > 59) {
      throw ArgumentError('minute must be between 0 and 59');
    }
    _logger.fine('Validated fields for NotificationSetting: $type');
  }

  // Convert stored hour and minute to TimeOfDay
  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }

  // Update hour and minute from a TimeOfDay object
  void updateTimeOfDay(TimeOfDay time) {
    hour = time.hour;
    minute = time.minute;
  }

  NotificationSettingModel copyWith({
    NotificationType? type,
    DateTime? dateTime,
    TimeOfDay? time,
    RecurrenceType? recurrenceType,
    int? recurrenceInterval,
    List<int>? weekdays,
    MonthlyRecurrenceType? monthlyRecurrenceType,
    int? dayOfMonth,
    int? weekOfMonth,
    int? monthOfYear,
    RecurrenceEnd? recurrenceEnd,
    int? recurrenceCount,
    DateTime? recurrenceEndDate,
    bool? isEasterRelated,
    bool? isEnabled,
  }) {
    return NotificationSettingModel(
      type: type ?? this.type,
      dateTime: dateTime ?? this.dateTime,
      hour: time?.hour ?? hour,
      minute: time?.minute ?? minute,
      recurrenceType: recurrenceType ?? this.recurrenceType,
      recurrenceInterval: recurrenceInterval ?? this.recurrenceInterval,
      weekdays: weekdays ?? this.weekdays,
      monthlyRecurrenceType:
          monthlyRecurrenceType ?? this.monthlyRecurrenceType,
      dayOfMonth: dayOfMonth ?? this.dayOfMonth,
      weekOfMonth: weekOfMonth ?? this.weekOfMonth,
      monthOfYear: monthOfYear ?? this.monthOfYear,
      recurrenceEnd: recurrenceEnd ?? this.recurrenceEnd,
      recurrenceCount: recurrenceCount ?? this.recurrenceCount,
      recurrenceEndDate: recurrenceEndDate ?? this.recurrenceEndDate,
      isEasterRelated: isEasterRelated ?? this.isEasterRelated,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}

/// Represents the types of notifications available.
enum NotificationType {
  oneTime,
  recurring,
  easterDaily,
  ashWednesday,
  palmSunday,
  holyThursday,
  goodFriday,
  holySaturday,
  easterSunday
}

/// Represents the types of recurrence patterns.
enum RecurrenceType {
  daily,
  weekly,
  monthly,
  yearly,
  none,

  /// Added by me to represent no recurrence and resolve the Isar build mentod issue.
  /// Because it was setting nullable value. To resolve the issue with the isar_generator
  /// error indicating that bytes must not be nullable, you need to ensure that
  /// the RecurrenceType field is not nullable.
}

/// Represents the types of monthly recurrence patterns.
enum MonthlyRecurrenceType {
  dayOfMonth,
  dayOfWeek,
  none,

  /// Added by me to represent no recurrence and resolve the Isar build mentod issue.
  /// Because it was setting nullable value. To resolve the issue with the isar_generator
  /// error indicating that bytes must not be nullable, you need to ensure that
  /// the RecurrenceType field is not nullable.
}

/// Represents the end conditions for recurring notifications.
enum RecurrenceEnd { forever, specificNumber, untilDate, upcomingYear }
