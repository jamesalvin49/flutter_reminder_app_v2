import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:reminder_app_v2/data/models/easter_date_calculator.dart';
import 'package:reminder_app_v2/data/models/notification_settings_model.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

/// Repository for managing notification settings and Easter dates in the database.
/// CRUD operations for both NotificationSetting and EasterDateCalculator entities.
/// Error handling with try-catch blocks and logging for each operation.
/// A method ensureEasterDatesForYearRange to populate the database with Easter dates
///   for a range of years.
/// Use of Isar's transaction API for write operations to ensure data consistency.
/// Dependency injection of the Isar instance for better testability.
///
/// This repository provides a clean and efficient way to manage your app's
/// notification data. It abstracts away the database operations, allowing the rest
/// of your app to work with a simple API for managing notifications and Easter dates.

class NotificationRepository {
  final Isar _isar;
  final Logger _logger = Logger('NotificationRepository');

  /// Creates a new instance of [NotificationRepository].
  ///
  /// Requires an [Isar] instance to be provided.
  NotificationRepository(this._isar);

  // NotificationSetting CRUD operations

  /// Adds a new notification setting to the database.
  ///
  /// Returns the ID of the newly created setting.
  Future<int> addNotificationSetting(NotificationSettingModel setting) async {
    try {
      return await _isar.writeTxn(() async {
        return await _isar.notificationSettingModels
            .put(setting); // put() will insert or update
      });
    } catch (e) {
      _logger.severe('Error adding notification setting', e);
      throw DatabaseException(
          'Failed to add notification setting: ${e.toString()}');
    }
  }
  Future<void> cleanupPassedOneTimeReminders() async {
    try {
      final now = DateTime.now();
      await _isar.writeTxn(() async {
        await _isar.notificationSettingModels
            .filter()
            .recurrenceTypeEqualTo(RecurrenceType.none)
            .and()
            .dateTimeLessThan(now)
            .deleteAll();
      });
    } catch (e) {
      _logger.severe('Error cleaning up passed one-time reminders', e);
      throw DatabaseException(
          'Failed to clean up passed one-time reminders: ${e.toString()}');
    }
  }

  /// Retrieves a notification setting by its ID.
  ///
  /// Returns null if no setting is found with the given ID.
  Future<NotificationSettingModel?> getNotificationSetting(int id) async {
    try {
      return await _isar.notificationSettingModels.get(id);
    } catch (e) {
      _logger.severe('Error getting notification setting', e);
      throw DatabaseException(
          'Failed to get notification setting: ${e.toString()}');
    }
  }

  /// Updates an existing notification setting in the database.
  ///
  /// Returns true if the update was successful, false otherwise.
  Future<bool> updateNotificationSetting(
      NotificationSettingModel setting) async {
    try {
      return await _isar.writeTxn(() async {
        return await _isar.notificationSettingModels.put(setting) != 0;
      });
    } catch (e) {
      _logger.severe('Error updating notification setting', e);
      throw DatabaseException(
          'Failed to update notification setting: ${e.toString()}');
    }
  }

  /// Deletes a notification setting from the database.
  ///
  /// Returns true if the deletion was successful, false otherwise.

  Future<bool> deleteNotificationSetting(int id) async {
    try {
      return await _isar.writeTxn(() async {
        return await _isar.notificationSettingModels.delete(id);
      });
    } catch (e) {
      _logger.severe('Error deleting notification setting', e);
      throw DatabaseException(
          'Failed to delete notification setting: ${e.toString()}');
    }
  }

  /// Retrieves all notification settings from the database.
  Future<List<NotificationSettingModel>> getAllNotificationSettings() async {
    try {
      return await _isar.notificationSettingModels.where().findAll();
    } catch (e) {
      _logger.severe('Error getting all notification settings', e);
      throw DatabaseException(
          'Failed to get all notification settings: ${e.toString()}');
    }
  }

  /// Retrieves all active notification settings from the database.
Future<List<NotificationSettingModel>> getActiveNotificationSettings() async {
    try {
      final now = DateTime.now();
      return await _isar.notificationSettingModels
          .filter()
          .isEnabledEqualTo(true)
          .and()
          .group((q) => q
              .not()
              .recurrenceTypeEqualTo(RecurrenceType.none)
              .or()
              .dateTimeGreaterThan(now))
          .findAll();
    } catch (e) {
      _logger.severe('Error getting active notification settings', e);
      throw DatabaseException(
          'Failed to get active notification settings: ${e.toString()}');
    }
  }
  // EasterDateCalculator CRUD operations

  /// Adds a new Easter date calculator entry to the database.
  ///
  /// Returns the ID of the newly created entry.
  Future<int> addEasterDate(EasterDateCalculator easterDate) async {
    try {
      return await _isar.writeTxn(() async {
        return await _isar.easterDateCalculators.put(easterDate);
      });
    } catch (e) {
      _logger.severe('Error adding Easter date', e);
      throw DatabaseException('Failed to add Easter date: ${e.toString()}');
    }
  }

  /// Retrieves an Easter date calculator entry by year.
  ///
  /// Returns null if no entry is found for the given year.
  Future<EasterDateCalculator?> getEasterDateByYear(int year) async {
    try {
      return await _isar.easterDateCalculators
          .filter()
          .yearEqualTo(year)
          .findFirst();
    } catch (e) {
      _logger.severe('Error getting Easter date by year', e);
      throw DatabaseException('Failed to get Easter date: ${e.toString()}');
    }
  }

  /// Updates an existing Easter date calculator entry in the database.
  ///
  /// Returns true if the update was successful, false otherwise.
  Future<bool> updateEasterDate(EasterDateCalculator easterDate) async {
    try {
      return await _isar.writeTxn(() async {
        return await _isar.easterDateCalculators.put(easterDate) != 0;
      });
    } catch (e) {
      _logger.severe('Error updating Easter date', e);
      throw DatabaseException('Failed to update Easter date: ${e.toString()}');
    }
  }

  /// Deletes an Easter date calculator entry from the database.
  ///
  /// Returns true if the deletion was successful, false otherwise.
  Future<bool> deleteEasterDate(int id) async {
    try {
      return await _isar.writeTxn(() async {
        return await _isar.easterDateCalculators.delete(id);
      });
    } catch (e) {
      _logger.severe('Error deleting Easter date', e);
      throw DatabaseException('Failed to delete Easter dates: ${e.toString()}');
    }
  }

  /// Retrieves all Easter date calculator entries from the database.
  Future<List<EasterDateCalculator>> getAllEasterDates() async {
    try {
      return await _isar.easterDateCalculators.where().findAll();
    } catch (e) {
      _logger.severe('Error getting all Easter dates', e);
      throw DatabaseException(
          'Failed to get all Easter dates: ${e.toString()}');
    }
  }

  /// Ensures that Easter dates are available for the given range of years.
  ///
  /// If dates are missing, it calculates and adds them to the database.

  Future<void> ensureEasterDatesForYearRange(int startYear, int endYear) async {
    try {
      await _isar.writeTxn(() async {
        for (int year = startYear; year <= endYear; year++) {
          var existingDate = await _isar.easterDateCalculators
              .filter()
              .yearEqualTo(year)
              .findFirst();
          if (existingDate == null) {
            try {
              var easterSunday =
                  EasterDateCalculator.calculateEasterSunday(year);
              var newEasterDate =
                  EasterDateCalculator(year: year, easterSunday: easterSunday);
              await _isar.easterDateCalculators.put(newEasterDate);
              _logger.info('Added Easter date for year $year');
            } catch (e) {
              _logger.warning(
                  'Failed to calculate Easter date for year $year', e);
              // Continue with the next year instead of throwing an exception
            }
          }
        }
      });
    } catch (e) {
      _logger.severe('Error ensuring Easter dates for year range', e);
      throw DatabaseException('Failed to ensure Easter dates: ${e.toString()}');
    }
  }

  Future<void> deleteAllNotificationSettings() async {
    try {
      await _isar.writeTxn(() async {
        await _isar.notificationSettingModels.clear();
      });
      _logger.info('Deleted all notification settings');
    } catch (e) {
      _logger.severe('Error deleting all notification settings', e);
      throw DatabaseException(
          'Failed to delete all notification settings: ${e.toString()}');
    }
  }

  Future<void> deleteAllEasterDates() async {
    try {
      await _isar.writeTxn(() async {
        await _isar.easterDateCalculators.clear();
      });
      _logger.info('Deleted all Easter dates');
    } catch (e) {
      _logger.severe('Error deleting all Easter dates', e);
      throw DatabaseException(
          'Failed to delete all Easter dates: ${e.toString()}');
    }
  }
}
