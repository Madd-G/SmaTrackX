import 'package:smatrackx/core.dart';

extension DateTimeExt on DateTime {
  /// 01:34:43
  String get clockFormat {
    final now = DateTime.now();
    return DateFormat("H:mm:ss").format(now);
  }

  /// 01:34
  String extractHourMinute() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  /// 09 November 2023
  String get dateFormat {
    final now = DateTime.now();
    return DateFormat("dd MMMM yyyy").format(now);
  }

  /// 2023-11-09
  String yearMonthDay() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// 12 Dec 2023
  String get shortMonthYearFormat {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String get timeAgo {
    final nowUtc = DateTime.now().toUtc();

    final difference = nowUtc.difference(toUtc());

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years.pluralize} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months.pluralize} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays.pluralize} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours.pluralize} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} '
          'minute${difference.inMinutes.pluralize} ago';
    } else {
      return 'now';
    }
  }

  /// Friday, 04 January 2024
  String toDayDateMonthYear() {
    final days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday',];

    final months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December',];

    final dayOfWeek = days[weekday - 1];
    final dayOfMonth = day.toString().padLeft(2, '0');
    final month = months[this.month - 1];
    final year = this.year;

    return '$dayOfWeek, $dayOfMonth $month $year';
  }
}
