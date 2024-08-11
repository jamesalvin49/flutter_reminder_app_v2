// Export these for use in integration tests
export 'main.dart' show initializeServices, MyApp;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:reminder_app_v2/data/managers/notification_controller.dart';

Future<void> initializeServices() async {
  // Initialize AwesomeNotifications
  await AwesomeNotifications().initialize(
      null, // 'resource://drawable/res_app_icon',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
        )
      ],
      debug: true);

  // Set up AwesomeNotifications listeners
  AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();

  runApp(
    ProviderScope(
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
      // Add more routes or use a router for additional screens
    );
  }
}

