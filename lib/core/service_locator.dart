import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:reminder_app_v2/core/app_initializer.dart';
import 'package:reminder_app_v2/data/managers/local_notification_manager.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/repositories/notification_repository.dart';
import 'package:reminder_app_v2/data/services/notification_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register AppInitializer
  getIt.registerSingleton<AppInitializer>(AppInitializer());

  // Register LocalNotificationManager
  getIt.registerSingleton<LocalNotificationManager>(LocalNotificationManager());

  // Other registrations will be done after Isar is initialized in main.dart
}

Future<void> registerDependencies(Isar isar) async {
  // Register Isar
  getIt.registerSingleton<Isar>(isar);

  // Register Repository
  getIt.registerSingleton<NotificationRepository>(NotificationRepository(isar));

  // Register NotificationService
  getIt.registerSingleton<NotificationService>(NotificationService());

  // Register SimplifiedNotificationManager
  getIt.registerSingleton<SimplifiedNotificationManager>(
      SimplifiedNotificationManager());
}
