import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_app_v2/data/managers/simplified_notification_manager.dart';
import 'package:reminder_app_v2/data/providers/reminder_settings_notifier.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';



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
        ],
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context, UserNotificationSettings settings, ReminderSettingsNotifier notifier) {
    return ListTile(
      title: const Text('Reminder Time for All Selected Events'),
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

  Widget _buildEasterRemindersSection(UserNotificationSettings settings, ReminderSettingsNotifier notifier) {
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

  Widget _buildAdditionalRemindersSection(BuildContext context, UserNotificationSettings settings, ReminderSettingsNotifier notifier) {
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
        if (settings.oneTimeReminderDate != null)
          ListTile(
            title: const Text('One-Time Reminder Date'),
            subtitle: Text(settings.oneTimeReminderDate!.toLocal().toString().split(' ')[0]),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => _selectDate(context, notifier),
          ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context, ReminderSettingsNotifier notifier) {
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

  void _selectDate(BuildContext context, ReminderSettingsNotifier notifier) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      notifier.setOneTimeReminder(picked);
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

