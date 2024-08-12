class NotificationException implements Exception {
  final String message;
  final String? code;

  NotificationException(this.message, [this.code]);

  @override
  String toString() => 'NotificationException: $message${code != null ? ' (Code: $code)' : ''}';
}

class DatabaseException implements Exception {
  final String message;
  final String? code;

  DatabaseException(this.message, [this.code]);

  @override
  String toString() => 'DatabaseException: $message${code != null ? ' (Code: $code)' : ''}';
}

class EasterDateCalculationException implements Exception {
  final String message;
  final int? year;

  EasterDateCalculationException(this.message, [this.year]);

  @override
  String toString() => 'EasterDateCalculationException: $message${year != null ? ' (Year: $year)' : ''}';
}

class InvalidNotificationSettingException implements Exception {
  final String message;

  InvalidNotificationSettingException(this.message);

  @override
  String toString() => 'InvalidNotificationSettingException: $message';
}

class NotifierException implements Exception {
  final String message;

  NotifierException(this.message);

  @override
  String toString() => 'Notifier: $message';
}

class AppInitializerException implements Exception {
  final String message;

  AppInitializerException(this.message);

  @override
  String toString() => 'Notifier: $message';
}