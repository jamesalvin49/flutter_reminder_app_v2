import 'package:flutter_test/flutter_test.dart';
import 'package:reminder_app_v2/data/models/easter_date_calculator.dart';
import 'package:reminder_app_v2/utils/custom_exceptions.dart';

void main() {
  group('EasterDateCalculator', () {
    test('calculateEasterSunday returns correct date for known years', () {
      expect(EasterDateCalculator.calculateEasterSunday(2023), DateTime(2023, 4, 9));
      expect(EasterDateCalculator.calculateEasterSunday(2024), DateTime(2024, 3, 31));
      expect(EasterDateCalculator.calculateEasterSunday(2025), DateTime(2025, 4, 20));
    });

    test('calculateEasterSunday handles leap years correctly', () {
      expect(EasterDateCalculator.calculateEasterSunday(2020), DateTime(2020, 4, 12));
      expect(EasterDateCalculator.calculateEasterSunday(2024), DateTime(2024, 3, 31));
    });

    test('calculateEasterSunday handles year 2100 correctly (not a leap year)', () {
      expect(EasterDateCalculator.calculateEasterSunday(2100), DateTime(2100, 3, 28));
    });

    test('EasterDateCalculator initializes related dates correctly', () {
      final calculator = EasterDateCalculator(year: 2023, easterSunday: DateTime(2023, 4, 9));
      
      expect(calculator.ashWednesday, DateTime(2023, 2, 22));
      expect(calculator.palmSunday, DateTime(2023, 4, 2));
      expect(calculator.holyThursday, DateTime(2023, 4, 6));
      expect(calculator.goodFriday, DateTime(2023, 4, 7));
      expect(calculator.holySaturday, DateTime(2023, 4, 8));
    });

    test('getDateForDay returns correct dates', () {
      final calculator = EasterDateCalculator(year: 2023, easterSunday: DateTime(2023, 4, 9));
      
      expect(calculator.getDateForDay(EasterRelatedDay.ashWednesday), DateTime(2023, 2, 22));
      expect(calculator.getDateForDay(EasterRelatedDay.palmSunday), DateTime(2023, 4, 2));
      expect(calculator.getDateForDay(EasterRelatedDay.holyThursday), DateTime(2023, 4, 6));
      expect(calculator.getDateForDay(EasterRelatedDay.goodFriday), DateTime(2023, 4, 7));
      expect(calculator.getDateForDay(EasterRelatedDay.holySaturday), DateTime(2023, 4, 8));
      expect(calculator.getDateForDay(EasterRelatedDay.easterSunday), DateTime(2023, 4, 9));
    });

    test('EasterDateCalculator throws exception for invalid Easter Sunday', () {
      expect(
        () => EasterDateCalculator(year: 2023, easterSunday: DateTime(2023, 4, 10)),
        throwsA(isA<EasterDateCalculationException>()),
      );
    });
  });
}