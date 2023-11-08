import 'package:SmaTrackX/core.dart';

class HomeService {
  Stream<DocumentSnapshot<Map<String, dynamic>>> attendanceHistorySnapshot() {
    return FirebaseFirestore.instance
        .doc('attendances/axwoQG9JPKcQKtm6rtvgcaC5Zxk1')
        .snapshots();
  }

  List<DateTime> getWeekRange(DateTime date) {
    int dayOfWeek = date.weekday;
    DateTime startOfWeek = date.subtract(Duration(days: dayOfWeek));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    return [startOfWeek, endOfWeek];
  }

  List<DateTime> getCurrentWeekRange() {
    final now = DateTime.now();
    return getWeekRange(now);
  }
}
