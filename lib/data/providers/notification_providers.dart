// In notification_providers.dart
export 'notification_providers.dart' show isarProvider;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:reminder_app_v2/data/managers/local_notification_manager.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/models/easter_date_calculator.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';
import 'package:reminder_app_v2/data/repositories/notification_repository.dart';
import 'package:reminder_app_v2/data/services/notification_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reminder_app_v2/utils/app_config.dart';

final isarProvider = FutureProvider<Isar>((ref) async {
  // Initialize and return your Isar instance
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([NotificationSettingModelSchema, EasterDateCalculatorSchema],
      directory: dir.path, name: AppConfig.databaseName, inspector: true);
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
