import 'package:intl/intl.dart';

class TimeUtils {
  static final _timeFormat = DateFormat('HH:mm');

  static DateTime todayAt(int hour, int minute) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  static String formatTime(DateTime time) => _timeFormat.format(time);

  static bool isWithinBusinessHours(DateTime start, DateTime end) {
    final open = todayAt(9, 0);
    final close = todayAt(18, 0);
    return !start.isBefore(open) && !end.isAfter(close);
  }

  static List<DateTime> generatePossibleStarts(int slotIntervalMinutes) {
    final List<DateTime> slots = [];
    DateTime current = todayAt(9, 0);
    final end = todayAt(18, 0);

    while (current.isBefore(end)) {
      slots.add(current);
      current = current.add(Duration(minutes: slotIntervalMinutes));
    }
    return slots;
  }
}