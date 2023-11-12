import 'package:SmaTrackX/core.dart';

extension StatusCounts on List<Map<String, dynamic>> {
  Map<String, int> countStatus() {
    int arriveCount = 0;
    int leaveCount = 0;
    int absenceCount = 0;

    for (var entry in this) {
      if (entry['checkInInfo'] != null &&
          entry['checkInInfo']['status'] != null) {
        var status = entry['checkInInfo']['status'].toLowerCase();
        if (status == 'on time' || status == 'late') {
          arriveCount++;
        } else if (status == 'leave') {
          leaveCount++;
        } else if (status == 'absence') {
          absenceCount++;
        }
      }
    }

    return {
      'arriveCount': arriveCount,
      'leaveCount': leaveCount,
      'absenceCount': absenceCount,
    };
  }
}

extension DateTimeExtensions on DateTime {
  List<DateTime> getWeekRange() {
    int dayOfWeek = weekday;
    DateTime startOfWeek = subtract(Duration(days: dayOfWeek));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    return [startOfWeek, endOfWeek];
  }

  List<DateTime> getCurrentWeekRange() {
    final now = DateTime.now();
    return now.getWeekRange();
  }
}

extension MapExtensions on Map<String, dynamic> {
  List<MapEntry<String, dynamic>> filterByMonth(int month) {
    return entries.where((entry) {
      final checkInData = CheckInData.fromMap(entry.value);
      final date = DateTime.parse(checkInData.date);
      return date.month == month;
    }).toList();
  }

  Map<String, int> countStatus() {
    int arriveCount = 0;
    int leaveCount = 0;
    int absenceCount = 0;

    for (var entry in entries) {
      if (entry.value['checkInInfo'] != null &&
          entry.value['checkInInfo']['status'] != null) {
        var status = entry.value['checkInInfo']['status'].toLowerCase();
        if (status == 'on time' || status == 'late') {
          arriveCount++;
        } else if (status == 'leave') {
          leaveCount++;
        } else if (status == 'absence') {
          absenceCount++;
        }
      }
    }

    return {
      'arriveCount': arriveCount,
      'leaveCount': leaveCount,
      'absenceCount': absenceCount,
    };
  }
}
