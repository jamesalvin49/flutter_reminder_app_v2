// Export these for use in integration tests
//export 'main.dart' show initializeServices, MyApp;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:reminder_app_v2/core/app_initializer.dart';
import 'package:reminder_app_v2/core/service_locator.dart';
import 'package:reminder_app_v2/data/managers/notification_controller.dart';
import 'package:reminder_app_v2/screens/option_1/setting_screen_option_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await setupServiceLocator();

  final appInitializer = getIt<AppInitializer>();
  await appInitializer.initialize();

  // Get the Isar instance from AppInitializer
  final Isar isar = await appInitializer.getIsarInstance();

  // Register the remaining dependencies
  await registerDependencies(isar);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Stations of the Cross',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SettingsScreenOption1(),
      navigatorKey: NotificationController.navigatorKey,
      // Add more routes or use a router for additional screens
    );
  }
}
