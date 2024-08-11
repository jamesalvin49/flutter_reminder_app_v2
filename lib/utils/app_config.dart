import 'package:flutter/material.dart';

class AppConfig {
  // Notification Channels
  static const String oneTimeChannel = 'one_time_channel';
  static const String dailyReminderChannel = 'daily_reminder_channel';
  static const String weeklyReminderChannel = 'weekly_reminder_channel';
  static const String monthlyReminderChannel = 'monthly_reminder_channel';
  static const String yearlyReminderChannel = 'yearly_reminder_channel';
  static const String easterChannel = 'easter_channel';

  // Notification Channel Names
  static const String oneTimeChannelName = 'One-time Notifications';
  static const String dailyReminderChannelName = 'Daily Reminders';
  static const String weeklyReminderChannelName = 'Weekly Reminders';
  static const String monthlyReminderChannelName = 'Monthly Reminders';
  static const String yearlyReminderChannelName = 'Yearly Reminders';
  static const String easterChannelName = 'Easter Notifications';

  // Notification Channel Descriptions
  static const String oneTimeChannelDescription = 'Channel for one-time notifications';
  static const String dailyReminderChannelDescription = 'Channel for daily reminder notifications';
  static const String weeklyReminderChannelDescription = 'Channel for weekly reminder notifications';
  static const String monthlyReminderChannelDescription = 'Channel for monthly reminder notifications';
  static const String yearlyReminderChannelDescription = 'Channel for yearly reminder notifications';
  static const String easterChannelDescription = 'Channel for Easter-related notifications';

  // Notification Colors
  static const Color defaultNotificationColor = Color(0xFF9D50DD);
  static const Color notificationLedColor = Colors.white;

  // App Icon
  static const String appIconResourcePath = 'resource://drawable/res_notification_app_icon';

  // Time Constants
  static const int defaultReminderHour = 9;
  static const int defaultReminderMinute = 0;

  // Easter Date Range
  static const int easterDateRangeStart = -46; // Ash Wednesday
  static const int easterDateRangeEnd = 0;  // Easter Sunday

  // Logging
  static const String loggerName = 'ReminderApp';

  // Database
  static const String databaseName = 'reminder_app.isar';
}