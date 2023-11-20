import 'package:SmaTrackX/core.dart';

abstract class AttendanceRepository {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAttendanceHistorySnapshot(
      String uid);
}
