
/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/providers/reminder_settings_notifier.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

class ReminderSettingsScreen extends ConsumerWidget {
  const ReminderSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(reminderSettingsProvider);
    final notifier = ref.read(reminderSettingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Reminder Settings')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildTimePicker(context, settings.reminderTime, notifier),
          _buildLifetimeSwitch(settings.isLifetimeReminder, notifier),
          _buildEasterReminders(settings.easterReminders, notifier),
          _buildDailyReminderSwitch(settings.hasDailyReminder, notifier),
          _buildOneTimeReminder(context, settings.oneTimeReminderDate, notifier),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Save Settings'),
            onPressed: () async {
              try {
                await notifier.saveSettings();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Settings saved')),
              );
              } catch (e) {
                String errorMessage = 'An error occurred while saving settings';
                if (e is NotificationException) {
                  errorMessage = e.message;
                } else if (e is DatabaseException) {
                  errorMessage = 'Database error: ${e.message}';
                } else if (e is EasterDateCalculationException) {
                  errorMessage = 'Error calculating Easter date: ${e.message}';
                } else if (e is InvalidNotificationSettingException) {
                  errorMessage = 'Invalid notification setting: ${e.message}';
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
                );
              }
              
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context, TimeOfDay reminderTime, ReminderSettingsNotifier notifier) {
    return ListTile(
      title: Text('Reminder Time for All Events'),
      trailing: Text(reminderTime.format(context)),
      onTap: () async {
        TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: reminderTime,
        );
        if (picked != null && picked != reminderTime) {
          notifier.setReminderTime(picked);
        }
      },
    );
  }

  Widget _buildLifetimeSwitch(bool isLifetimeReminder, ReminderSettingsNotifier notifier) {
    return SwitchListTile(
      title: Text('Repeat Every Year'),
      value: isLifetimeReminder,
      onChanged: (bool value) => notifier.setLifetimeReminder(value),
    );
  }

  Widget _buildEasterReminders(Map<EasterEventType, bool> easterReminders, ReminderSettingsNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text('Easter Reminders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ...easterReminders.entries.map((entry) {
          return CheckboxListTile(
            title: Text(_getEasterEventName(entry.key)),
            value: entry.value,
            onChanged: (bool? value) => notifier.setEasterReminder(entry.key, value ?? false),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildDailyReminderSwitch(bool hasDailyReminder, ReminderSettingsNotifier notifier) {
    return SwitchListTile(
      title: Text('Daily Reminder'),
      value: hasDailyReminder,
      onChanged: (bool value) => notifier.setDailyReminder(value),
    );
  }

  Widget _buildOneTimeReminder(BuildContext context, DateTime? oneTimeReminderDate, ReminderSettingsNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text('One-Time Reminder'),
          value: oneTimeReminderDate != null,
          onChanged: (bool value) async {
            if (value) {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
              );
              notifier.setOneTimeReminder(picked);
            } else {
              notifier.setOneTimeReminder(null);
            }
          },
        ),
        if (oneTimeReminderDate != null)
          Padding(

          */