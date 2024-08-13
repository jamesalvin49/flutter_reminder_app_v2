// Export these for use in integration tests
//export 'main.dart' show initializeServices, MyApp;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_app_v2/core/app_initializer.dart';
import 'package:reminder_app_v2/data/managers/notification_controller.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appInitializer = AppInitializer();
  await appInitializer.initialize();

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
      home: const Scaffold(),
      navigatorKey: NotificationController.navigatorKey,
      // Add more routes or use a router for additional screens
    );
  }
}

