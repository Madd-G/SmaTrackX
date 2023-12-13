import 'package:smatrackx/core.dart';

abstract class AttendanceRepository {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAttendanceHistorySnapshot(
      String uid);
}
