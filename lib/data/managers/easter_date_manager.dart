import 'dart:isolate';

import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:reminder_app_v2/data/models/easter_date_calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EasterDateManager {
  final Isar isarInstance;
  final Logger _logger = Logger('EasterDateManager');
  static const String lastUpdateKey = 'last_easter_date_update';
  static const int updateIntervalDays = 30;
  static const int yearsToCalculate = 20;

  EasterDateManager(this.isarInstance);

  Future<void> initializeEasterDates() async {
    final receivePort = ReceivePort();
    final String? isarPath = isarInstance.directory;

    if (isarPath == null) {
      _logger.severe('Isar directory is null. Cannot initialize Easter dates.');
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final lastUpdate = prefs.getInt(lastUpdateKey) ?? 0;

    await Isolate.spawn(
      _isolateInitializer,
      _IsolateInitData(
        sendPort: receivePort.sendPort,
        isarName: isarInstance.name,
        isarPath: isarPath,
        lastUpdate: lastUpdate,
      ),
    );

    await for (final message in receivePort) {
      if (message == 'done') {
        receivePort.close();
        break;
      } else if (message is int) {
        await prefs.setInt(lastUpdateKey, message);
      } else if (message is String && message.startsWith('error:')) {
        _logger.severe('Error in isolate: ${message.substring(6)}');
        receivePort.close();
        break;
      }
    }
  }

  static Future<void> _isolateInitializer(_IsolateInitData initData) async {
    try {
      final isar = await Isar.open(
        [EasterDateCalculatorSchema],
        directory: initData.isarPath,
        name: initData.isarName,
      );

      final now = DateTime.now();
      if (now
              .difference(
                  DateTime.fromMillisecondsSinceEpoch(initData.lastUpdate))
              .inDays >=
          updateIntervalDays) {
        await _updateEasterDates(isar);
        initData.sendPort.send(now.millisecondsSinceEpoch);
      }

      await isar.close();
      initData.sendPort.send('done');
    } catch (e) {
      initData.sendPort.send('error: $e');
    }
  }

  static Future<void> _updateEasterDates(Isar isar) async {
    final currentYear = DateTime.now().year;
    final targetYear = currentYear + yearsToCalculate;

    await isar.writeTxn(() async {
      // Add pre-calculated dates
      for (var entry in _precalculatedEasterDates.entries) {
        if (entry.key >= currentYear && entry.key <= targetYear) {
          await _addEasterDateIfMissing(isar, entry.key, entry.value);
        }
      }

      // Calculate and add missing dates
      for (int year = currentYear; year <= targetYear; year++) {
        if (!_precalculatedEasterDates.containsKey(year)) {
          final easterSunday = EasterDateCalculator.calculateEasterSunday(year);
          await _addEasterDateIfMissing(isar, year, easterSunday);
        }
      }
    });
  }


  static Future<void> _addEasterDateIfMissing(
      Isar isar, int year, DateTime easterSunday) async {
    final existingEntry =
        await isar.easterDateCalculators.filter().yearEqualTo(year).findFirst();

    if (existingEntry == null) {
      final calculator = EasterDateCalculator(
        year: year,
        easterSunday: easterSunday,
      );
      await isar.easterDateCalculators.put(calculator);
    }
  }

  static  final Map<int, DateTime> _precalculatedEasterDates = {
    2024: DateTime(2024, 3, 31),
    2025: DateTime(2025, 4, 20),
    // ... (add more pre-calculated dates as needed)
  };
}

class _IsolateInitData {
  final SendPort sendPort;
  final String isarName;
  final String isarPath;
  final int lastUpdate;

  _IsolateInitData({
    required this.sendPort,
    required this.isarName,
    required this.isarPath,
    required this.lastUpdate,
  });
}
