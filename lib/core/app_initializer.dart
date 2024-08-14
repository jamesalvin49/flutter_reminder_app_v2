import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reminder_app_v2/data/managers/easter_date_manager.dart';
import 'package:reminder_app_v2/data/managers/notification_controller.dart';
import 'package:reminder_app_v2/data/models/easter_date_calculator.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';
import 'package:reminder_app_v2/utils/app_config.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

class AppInitializer {
  final Logger _logger = Logger('AppInitializer');
  static final AppInitializer _instance = AppInitializer._internal();
  Isar? _isarInstance;

  factory AppInitializer() {
    return _instance;
  }

  AppInitializer._internal();

  Future<void> initialize() async {
    await initializeDatabase();
    await initializeEasterDates();
    await initializeNotifications();
  }

  Future<Isar> getIsarInstance() async {
    if (_isarInstance == null) {
      await initializeDatabase();
    }
    return _isarInstance!;
  }

  Future<void> initializeDatabase() async {
    if (_isarInstance == null) {
      final dir = await getApplicationDocumentsDirectory();
      _isarInstance = await Isar.open(
        [NotificationSettingModelSchema, EasterDateCalculatorSchema],
        directory: dir.path,
        name: AppConfig.databaseName,
        inspector: true,
      );
    }
    _logger.info('Database initialized');
  }

  Future<void> initializeEasterDates() async {
    final easterDateManager = EasterDateManager(_isarInstance!);
    await easterDateManager.initializeEasterDates();
    _logger.info('Easter dates initialized');
  }

  Future<void> initializeNotifications() async {
    try {
      await AwesomeNotifications().initialize(
        'resource://drawable/res_notification_app_icon', // App icon
        [
          NotificationChannel(
            channelKey: AppConfig.oneTimeChannel,
            channelName: AppConfig.oneTimeChannelName,
            channelDescription: AppConfig.oneTimeChannelDescription,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.white,
          ),
          NotificationChannel(
            channelKey: AppConfig.dailyReminderChannel,
            channelName: AppConfig.dailyReminderChannelName,
            channelDescription: AppConfig.dailyReminderChannelDescription,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.white,
          ),
          NotificationChannel(
            channelKey: AppConfig.weeklyReminderChannel,
            channelName: AppConfig.weeklyReminderChannelName,
            channelDescription: AppConfig.weeklyReminderChannelDescription,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.white,
          ),
          NotificationChannel(
            channelKey: AppConfig.monthlyReminderChannel,
            channelName: AppConfig.monthlyReminderChannelName,
            channelDescription: AppConfig.monthlyReminderChannelDescription,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.white,
          ),
          NotificationChannel(
            channelKey: AppConfig.yearlyReminderChannel,
            channelName: AppConfig.yearlyReminderChannelName,
            channelDescription: AppConfig.yearlyReminderChannelDescription,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.white,
          ),
          NotificationChannel(
            channelKey: AppConfig.easterChannel,
            channelName: AppConfig.easterChannelName,
            channelDescription: AppConfig.easterChannelDescription,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.white,
          ),
        ],
        debug: true,
      );

      // Set up notification listeners using NotificationController
      AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod,
      );

      _logger.info('LocalNotificationManager initialized successfully');
    } catch (e) {
      _logger.severe('Error initializing LocalNotificationManager', e);
      throw AppInitializerException(
          'Failed to initialize notifications: ${e.toString()}');
    }
  }
}
