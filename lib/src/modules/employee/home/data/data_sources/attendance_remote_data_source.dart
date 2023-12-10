import 'package:SmaTrackX/core.dart';

class AttendanceRemoteDataSource {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAttendanceHistorySnapshot(String uid) {
    return FirebaseFirestore.instance
        .doc('attendances/$uid')
        // .doc('attendances/pf6UvuKcE9eEeHxZttQk4OWmFQi2')
        .snapshots();
  }
}
