import 'package:SmaTrackX/core.dart';

class HomeService {
  Stream<DocumentSnapshot<Map<String, dynamic>>> attendanceHistorySnapshot() {
    return FirebaseFirestore.instance
        .doc('attendances/axwoQG9JPKcQKtm6rtvgcaC5Zxk1')
        .snapshots();
  }
}
