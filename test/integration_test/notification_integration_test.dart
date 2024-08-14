/*
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:reminder_app_v2/data/models/easter_date_calculator.dart';
import 'package:reminder_app_v2/data/providers/notification_providers.dart';
import 'package:reminder_app_v2/main.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/repositories/notification_repository.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dart:io';

// Import the generated mocks
import 'notification_integration_test.mocks.dart';

// Generate a MockPathProviderPlatform
@GenerateMocks([PathProviderPlatform])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late SimplifiedNotificationManager manager;
  late NotificationRepository repository;
  late Isar isar;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock the PathProviderPlatform
    final mockPathProviderPlatform = MockPathProviderPlatform();
    PathProviderPlatform.instance = mockPathProviderPlatform;

    final tempDir = Directory.systemTemp.createTempSync();
    final mockPath = tempDir.path;

    // Mock the getApplicationDocumentsPath() method
    when(mockPathProviderPlatform.getApplicationDocumentsPath())
        .thenAnswer((_) async => mockPath);
  });

  setUp(() async {
    // Initialize Isar
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NotificationSettingModelSchema, EasterDateCalculatorSchema],
      directory: dir.path,
      name: 'test_db',
    );

    // Initialize services
    //await initializeServices();

    // Override the isarProvider with our test instance
    final testIsarProvider = FutureProvider<Isar>((ref) async => isar);

    // Create a ProviderContainer with overrides
    container = ProviderContainer(
      overrides: [
        isarProvider.overrideWithProvider(testIsarProvider),
      ],
    );

    // Get instances of manager and repository from the ProviderContainer
    manager = container.read(simplifiedNotificationManagerProvider);
    repository = container.read(notificationRepositoryProvider);
  });

  tearDown(() async {
    // Close and delete the test database
    await isar.close(deleteFromDisk: true);
    container.dispose();
  });

  setUp(() async {
    // Clear existing notifications before each test
    await repository.deleteAllNotificationSettings();
  });

  testWidgets('Full notification lifecycle test', (WidgetTester tester) async {
    // Pump the widget tree
    await tester.pumpWidget(
      ProviderScope(
        parent: container,
        child: const MyApp(),
      ),
    );

    // 1. Set up initial notifications
    final initialSettings = UserNotificationSettings(
      reminderTime: TimeOfDay(hour: 9, minute: 0),
      isLifetimeReminder: true,
      easterReminders: {
        EasterEventType.ashWednesday: true,
        EasterEventType.easterSunday: true,
      },
      hasDailyReminder: true,
    );

    await manager.updateSettings(initialSettings);

    // Verify initial settings
    var savedSettings = await repository.getAllNotificationSettings();
    expect(savedSettings.length, 3); // 2 Easter reminders + 1 daily reminder
    expect(
        savedSettings
            .where((s) => s.type == NotificationType.ashWednesday)
            .length,
        1);
    expect(
        savedSettings
            .where((s) => s.type == NotificationType.easterSunday)
            .length,
        1);
    expect(
        savedSettings.where((s) => s.type == NotificationType.recurring).length,
        1);

    // 2. Update settings
    final updatedSettings = UserNotificationSettings(
      reminderTime: TimeOfDay(hour: 10, minute: 0),
      isLifetimeReminder: false,
      easterReminders: {
        EasterEventType.ashWednesday: false,
        EasterEventType.easterSunday: true,
        EasterEventType.goodFriday: true,
      },
      hasDailyReminder: false,
    );

    await manager.updateSettings(updatedSettings);

    // Verify updated settings
    savedSettings = await repository.getAllNotificationSettings();
    expect(savedSettings.length,
        2); // 2 Easter reminders (Ash Wednesday removed, Good Friday added)
    expect(
        savedSettings
            .where((s) => s.type == NotificationType.ashWednesday)
            .length,
        0);
    expect(
        savedSettings
            .where((s) => s.type == NotificationType.easterSunday)
            .length,
        1);
    expect(
        savedSettings
            .where((s) => s.type == NotificationType.goodFriday)
            .length,
        1);
    expect(
        savedSettings.where((s) => s.type == NotificationType.recurring).length,
        0);

    // Verify updated time
    expect(savedSettings.every((s) => s.hour == 10 && s.minute == 0), true);

    // 3. Test one-time reminder
    final oneTimeSettings = updatedSettings.copyWith(
      oneTimeReminderDate: DateTime.now().add(Duration(days: 1)),
    );

    await manager.updateSettings(oneTimeSettings);

    savedSettings = await repository.getAllNotificationSettings();
    expect(savedSettings.length, 3); // 2 Easter reminders + 1 one-time reminder
    expect(
        savedSettings.where((s) => s.type == NotificationType.oneTime).length,
        1);

    // 4. Clear all settings
    final clearSettings = UserNotificationSettings(
      reminderTime: TimeOfDay(hour: 9, minute: 0),
      isLifetimeReminder: false,
      easterReminders: {},
      hasDailyReminder: false,
    );

    await manager.updateSettings(clearSettings);

    savedSettings = await repository.getAllNotificationSettings();
    expect(savedSettings.length, 0);
  });
}

*/