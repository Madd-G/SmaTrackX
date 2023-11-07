import 'package:SmaTrackX/core.dart';

class HomeService {
  Stream<QuerySnapshot<Object?>>? attendanceHistorySnapshot({
    required DateTime date,
  }) {
    bool isToday = date.dateFormat == DateTime.now().dateFormat;

    if (isToday) {
      return FirebaseFirestore.instance
          .collection("attendances")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Timestamp.now().toDate().dateFormat)
          .where("user.uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection("attendances")
          .where("checkin_date_formatted", isEqualTo: DateTime.now().dateFormat)
          .where("user.uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    }
  }
}