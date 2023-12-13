import 'package:smatrackx/core.dart';

extension StatusCounts on List<Map<String, dynamic>> {
  Map<String, int> weekCountStatus() {
    int arriveCount = 0;
    int leaveCount = 0;
    int absenceCount = 0;

    for (var entry in this) {
      if (entry['checkInInfo'] != null &&
          entry['checkInInfo']['status'] != null) {
        var status = entry['checkInInfo']['status'];
        if (status == 'Arrived on time' || status == 'Arrived late') {
          arriveCount++;
        } else if (status == 'Leave') {
          leaveCount++;
        } else if (status == 'Absence') {
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
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 7));
    return [startOfWeek, endOfWeek];
  }

  List<DateTime> getCurrentWeekRange() {
    final now = DateTime.now();
    return now.getWeekRange();
  }

  List<DateTime> getSortedWeekRange() {
    List<DateTime> weekRange = getWeekRange();
    weekRange.sort((a, b) => a.compareTo(b));
    return weekRange;
  }
}

extension MapExtensions on Map<String, dynamic> {
  List<MapEntry<String, dynamic>> filterByMonth(int month) {
    List<MapEntry<String, dynamic>> dataList = entries.toList();

    // Filter by month
    dataList = dataList.where((entry) {
      final checkInData = CheckInDataModel.fromFirestore(entry.value);
      final date = DateTime.parse(checkInData.date);
      return date.month == month;
    }).toList();

    // Sort by date
    dataList.sort((a, b) {
      final dateA = DateTime.parse(a.value['date']);
      final dateB = DateTime.parse(b.value['date']);
      return dateA.compareTo(dateB);
    });

    return dataList;
  }

  Map<String, int> monthCountStatus() {
    int arriveCount = 0;
    int leaveCount = 0;
    int absenceCount = 0;

    for (var entry in entries) {
      if (entry.value['checkInInfo'] != null &&
          entry.value['checkInInfo']['status'] != null) {
        var status = entry.value['checkInInfo']['status'];
        if (status == 'Arrived on time' || status == 'Arrived late') {
          arriveCount++;
        } else if (status == 'Leave') {
          leaveCount++;
        } else if (status == 'Absence') {
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

extension MapListExtensions on List<MapEntry<String, dynamic>> {
  List<Map<String, dynamic>> toMapList() {
    return map((entry) => entry.value as Map<String, dynamic>).toList();
  }
}
