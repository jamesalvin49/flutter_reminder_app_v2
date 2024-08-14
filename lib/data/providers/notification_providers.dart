// In notification_providers.dart
export 'notification_providers.dart' show isarProvider;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:reminder_app_v2/core/app_initializer.dart';
import 'package:reminder_app_v2/core/service_locator.dart';
import 'package:reminder_app_v2/data/managers/local_notification_manager.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/providers/reminder_settings_notifier.dart';
import 'package:reminder_app_v2/data/repositories/notification_repository.dart';
import 'package:reminder_app_v2/data/services/notification_service.dart';

/*
final appInitializerProvider = Provider<AppInitializer>((ref) {
  return AppInitializer();
});

final isarProvider = FutureProvider<Isar>((ref) async {
  final appInitializer = ref.watch(appInitializerProvider);
  return await appInitializer.getIsarInstance();
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final isar = ref.watch(isarProvider);

  return isar.when(
      data: (isar) {
        return NotificationRepository(isar);
      },
      loading: () => throw Exception('Isar not loaded yet'),
      error: (e, _) {
        throw Exception('Error loading Isar: $e');
      });
});

final localNotificationManagerProvider =
    Provider<LocalNotificationManager>((ref) {
  return LocalNotificationManager();
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  final localManager = ref.watch(localNotificationManagerProvider);
  return NotificationService(repository, localManager);
});

final simplifiedNotificationManagerProvider =
    Provider<SimplifiedNotificationManager>((ref) {
  final service = ref.watch(notificationServiceProvider);
  final repository = ref.watch(notificationRepositoryProvider);
  return SimplifiedNotificationManager(service, repository);
});

final reminderSettingsProvider =
    StateNotifierProvider<ReminderSettingsNotifier, UserNotificationSettings>(
        (ref) {
  final manager = ref.watch(simplifiedNotificationManagerProvider);
  return ReminderSettingsNotifier(manager);
});
*/

final reminderSettingsProvider =
    StateNotifierProvider<ReminderSettingsNotifier, UserNotificationSettings>(
        (ref) {
  return ReminderSettingsNotifier();
});

// Keep this provider if you still need it in your UI
final simplifiedNotificationManagerProvider =
    Provider<SimplifiedNotificationManager>((ref) {
  return getIt<SimplifiedNotificationManager>();
});
