import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_app_v2/data/providers/notification_providers.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/providers/reminder_settings_notifier.dart';

class SettingsScreenOption1 extends ConsumerWidget {
  const SettingsScreenOption1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(reminderSettingsProvider);
    final notifier = ref.read(reminderSettingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTimePicker(context, settings, notifier),
          const SizedBox(height: 24),
          _buildEasterRemindersSection(settings, notifier),
          const SizedBox(height: 24),
          _buildAdditionalRemindersSection(context, settings, notifier),
          const SizedBox(height: 24),
          _buildSaveButton(context, notifier),
          const SizedBox(height: 24),
          const Text(
            'Note: The reminder time set above applies to all reminders, including one-time reminders.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context,
      UserNotificationSettings settings, ReminderSettingsNotifier notifier) {
    return ListTile(
      title: const Text('Reminder Time (applies to all reminders)'),
      subtitle: Text(settings.reminderTime.format(context)),
      trailing: const Icon(Icons.access_time),
      onTap: () async {
        final TimeOfDay? newTime = await showTimePicker(
          context: context,
          initialTime: settings.reminderTime,
        );
        if (newTime != null) {
          notifier.setReminderTime(newTime);
        }
      },
    );
  }

  Widget _buildEasterRemindersSection(
      UserNotificationSettings settings, ReminderSettingsNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Easter Reminders',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...EasterEventType.values.map((event) => CheckboxListTile(
              title: Text(_getEasterEventTitle(event)),
              value: settings.easterReminders[event] ?? false,
              onChanged: (bool? value) {
                if (value != null) {
                  notifier.setEasterReminder(event, value);
                }
              },
            )),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text('Remind Every Year'),
          subtitle: const Text('If off, reminders are for this year only'),
          value: settings.isLifetimeReminder,
          onChanged: (bool value) {
            notifier.setLifetimeReminder(value);
          },
        ),
      ],
    );
  }

  Widget _buildAdditionalRemindersSection(BuildContext context,
      UserNotificationSettings settings, ReminderSettingsNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Additional Reminders',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Daily Reminder'),
          value: settings.hasDailyReminder,
          onChanged: (bool value) {
            notifier.setDailyReminder(value);
          },
        ),
        SwitchListTile(
          title: const Text('One-Time Reminder'),
          value: settings.oneTimeReminderDate != null,
          onChanged: (bool value) {
            if (value) {
              _selectDate(context, notifier);
            } else {
              notifier.setOneTimeReminder(null);
            }
          },
        ),
        if (settings.oneTimeReminderDate != null && _combineDateTime(
                    settings.oneTimeReminderDate!, settings.reminderTime)
                .isAfter(DateTime.now()))
          ListTile(
            title: const Text('One-Time Reminder'),
            subtitle: Text(
              '${_formatDate(settings.oneTimeReminderDate!)} at ${settings.reminderTime.format(context)}',
              style: const TextStyle(fontSize: 16),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    notifier.setOneTimeReminder(null);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, notifier),
                ),
              ],
            ),
          ),
      ],
    );
  }

  DateTime _combineDateTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  // Add this method to your SettingsScreen class
  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  // Update or add this method in your SettingsScreen class
  void _editOneTimeReminder(
      BuildContext context,
      ReminderSettingsNotifier notifier,
      UserNotificationSettings settings) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: settings.oneTimeReminderDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: settings.reminderTime,
      );

      if (pickedTime != null) {
        final DateTime newDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        final String? error = notifier.setOneTimeReminder(newDateTime);
        if (error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          );
        }
      }
    }
  }

  Widget _buildSaveButton(
      BuildContext context, ReminderSettingsNotifier notifier) {
    return ElevatedButton(
      child: const Text('Save Settings'),
      onPressed: () async {
        try {
          await notifier.saveSettings();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Settings saved successfully')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving settings: ${e.toString()}')),
          );
        }
      },
    );
  }

  void _selectDate(
      BuildContext context, ReminderSettingsNotifier notifier) async {
    final currentSettings = notifier.state;
    final DateTime initialDate =
        currentSettings.oneTimeReminderDate ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      /*// Combine the picked date with the current reminder time
      final DateTime newDateTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
        currentSettings.reminderTime.hour,
        currentSettings.reminderTime.minute,
      );
      */

      final String? error = notifier.setOneTimeReminder(picked);
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      }
    }
  }

  String _getEasterEventTitle(EasterEventType event) {
    switch (event) {
      case EasterEventType.ashWednesday:
        return 'Ash Wednesday';
      case EasterEventType.palmSunday:
        return 'Palm Sunday';
      case EasterEventType.holyThursday:
        return 'Holy Thursday';
      case EasterEventType.goodFriday:
        return 'Good Friday';
      case EasterEventType.holySaturday:
        return 'Holy Saturday';
      case EasterEventType.easterSunday:
        return 'Easter Sunday';
    }
  }
}
