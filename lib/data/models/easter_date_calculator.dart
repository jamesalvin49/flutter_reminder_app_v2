import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

part 'easter_date_calculator.g.dart';

/// Stores and manages Easter dates and related holy days for a specific year.
/// Isar annotations for database integration, including a unique index on the year.
/// A constructor that takes the year and Easter Sunday date, then calculates all related dates.
/// A method to retrieve the date for a specific Easter-related day.
/// A static method to calculate Easter Sunday for any given year,
///   which can be used to populate the database with future years.
/// An enum to represent the different days related to Easter.
///
/// This class will work in conjunction with the NotificationSetting class to manage
/// Easter-related notifications efficiently.
/// The EasterDateCalculator provides the necessary dates, while NotificationSetting uses
/// these dates to schedule the actual notifications.

@collection // Isar annotation for database integration
class EasterDateCalculator {
  /// Unique identifier for the Easter date entry.
  Id id = Isar.autoIncrement;

  /// The year for which the Easter dates are calculated.
  @Index(unique: true, replace: true)
  late int year;

  /// The date of Easter Sunday for the specified year.
  late DateTime easterSunday;

  /// The date of Ash Wednesday for the specified year.
  late DateTime ashWednesday;

  /// The date of Palm Sunday for the specified year.
  late DateTime palmSunday;

  /// The date of Holy Thursday for the specified year.
  late DateTime holyThursday;

  /// The date of Good Friday for the specified year.
  late DateTime goodFriday;

  /// The date of Holy Saturday for the specified year.
  late DateTime holySaturday;

  /// Logger for this class.
  static final _logger = Logger('EasterDateCalculator');

  /// Creates a new [EasterDateCalculator] instance.
  ///
  /// Calculates all related dates based on the provided Easter Sunday date.
  /// Throws [ArgumentError] if the provided date is not a Sunday.
  EasterDateCalculator({
    required this.year,
    required this.easterSunday,
  }) {
    if (easterSunday.weekday != DateTime.sunday) {
      throw EasterDateCalculationException(
          'Easter Sunday must be a Sunday', year);
    }
    _calculateRelatedDates();
    _logger.info('Created EasterDateCalculator for year: $year');
  }

  /// Calculates all related dates based on Easter Sunday.
  void _calculateRelatedDates() {
    try {
      ashWednesday = _calculateAshWednesday(easterSunday);
      palmSunday = easterSunday.subtract(const Duration(days: 7));
      holyThursday = easterSunday.subtract(const Duration(days: 3));
      goodFriday = easterSunday.subtract(const Duration(days: 2));
      holySaturday = easterSunday.subtract(const Duration(days: 1));
      _logger.fine('Calculated related dates for year: $year');
    } catch (e) {
      throw EasterDateCalculationException(
          'Failed to calculate related dates', year);
    }
  }

  DateTime _calculateAshWednesday(DateTime easter) {
    // Check if the year is a leap year
    bool isLeapYear = _isLeapYear(easter.year);

    // Ash Wednesday is always 46 days before Easter Sunday
    DateTime ashWednesday = easter.subtract(const Duration(days: 46));

    // If the year is a leap year and Ash Wednesday falls on or after February 29th,
    // subtract one more day to account for the extra day in February
    if (isLeapYear && ashWednesday.isAfter(DateTime(easter.year, 2, 29))) {
      ashWednesday = ashWednesday.subtract(const Duration(days: 1));
    }

    return ashWednesday;
  }

  /// Checks if the given year is a leap year.
  bool _isLeapYear(int year) {
    if (year % 4 != 0) {
      return false;
    } else if (year % 100 != 0) {
      return true;
    } else if (year % 400 != 0) {
      return false;
    } else {
      return true;
    }
  }

  /// Returns the date for the specified [EasterRelatedDay].
  ///
  /// Throws [ArgumentError] if an invalid day is provided.
  DateTime getDateForDay(EasterRelatedDay day) {
    switch (day) {
      case EasterRelatedDay.ashWednesday:
        return ashWednesday;
      case EasterRelatedDay.palmSunday:
        return palmSunday;
      case EasterRelatedDay.holyThursday:
        return holyThursday;
      case EasterRelatedDay.goodFriday:
        return goodFriday;
      case EasterRelatedDay.holySaturday:
        return holySaturday;
      case EasterRelatedDay.easterSunday:
        return easterSunday;
      default:
        _logger.warning('Invalid EasterRelatedDay provided: $day');
        throw EasterDateCalculationException(
            'Invalid Easter-related day provided', year);
    }
  }

  /// Calculates Easter Sunday for the given year using the Meeus/Jones/Butcher algorithm.
  ///
  /// This method can be used to calculate Easter dates for years not yet in the database.
  static DateTime calculateEasterSunday(int year) {
    _logger.info('Calculating Easter Sunday for year: $year');
    try {
      int a = year % 19;
      int b = year ~/ 100;
      int c = year % 100;
      int d = b ~/ 4;
      int e = b % 4;
      int f = (b + 8) ~/ 25;
      int g = (b - f + 1) ~/ 3;
      int h = (19 * a + b - d - g + 15) % 30;
      int i = c ~/ 4;
      int k = c % 4;
      int l = (32 + 2 * e + 2 * i - h - k) % 7;
      int m = (a + 11 * h + 22 * l) ~/ 451;
      int month = (h + l - 7 * m + 114) ~/ 31;
      int day = ((h + l - 7 * m + 114) % 31) + 1;
      return DateTime(year, month, day);
    } catch (e) {
      throw EasterDateCalculationException(
          'Failed to calculate Easter Sunday', year);
    }
  }
}

/// Represents the different days related to Easter.
enum EasterRelatedDay {
  ashWednesday,
  palmSunday,
  holyThursday,
  goodFriday,
  holySaturday,
  easterSunday,
}
