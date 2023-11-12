import 'package:SmaTrackX/core.dart';

class HomeService {
  Stream<DocumentSnapshot<Map<String, dynamic>>> attendanceHistorySnapshot() {
    return FirebaseFirestore.instance
        .doc('attendances/${FirebaseAuth.instance.currentUser!.uid}')
        .snapshots();
  }
}
