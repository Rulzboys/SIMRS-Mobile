import 'package:intl/intl.dart';

/// Helper format tanggal & waktu dalam Bahasa Indonesia.
class DateFormatter {
  DateFormatter._();

  static final DateFormat _fullDate = DateFormat('d MMMM yyyy', 'id_ID');
  static final DateFormat _shortDate = DateFormat('d MMM yyyy', 'id_ID');
  static final DateFormat _time = DateFormat('HH.mm', 'id_ID');
  static final DateFormat _dayDate = DateFormat('EEEE, d MMM yyyy', 'id_ID');

  static String full(DateTime date) => _fullDate.format(date);
  static String short(DateTime date) => _shortDate.format(date);
  static String time(DateTime date) => '${_time.format(date)} WIB';
  static String withDay(DateTime date) => _dayDate.format(date);

  /// Menampilkan label relatif seperti "Hari ini", "Besok", atau tanggal biasa.
  static String relativeDay(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final diff = target.difference(today).inDays;

    if (diff == 0) return 'Hari ini';
    if (diff == 1) return 'Besok';
    if (diff == -1) return 'Kemarin';
    return short(date);
  }
}
