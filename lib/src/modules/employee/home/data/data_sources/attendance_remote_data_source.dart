import 'package:SmaTrackX/core.dart';

class AttendanceRemoteDataSource {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAttendanceHistorySnapshot(String uid) {
    return FirebaseFirestore.instance
        .doc('attendances/$uid')
        .snapshots();
  }
}
