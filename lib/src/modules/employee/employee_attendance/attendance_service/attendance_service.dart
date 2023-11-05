import 'package:SmaTrackX/core.dart';

class AttendanceService {
  checkIn({
    required String deviceModel,
    required String deviceId,
    required double latitude,
    required double longitude,
    required String time,
    required String photoUrl,
  }) async {
    /*
    attendances
      docId (generated-id)


    */
    await FirebaseFirestore.instance
        .collection("attendances")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Timestamp.now().toDate().dateFormat)
        .doc('check-in')
        .set({
      "date": Timestamp.now(),
      "checkin_date_formatted": Timestamp.now().toDate().dateFormat,
      "checkin_date": Timestamp.now(),
      "checkin_info": {
        "latitude": latitude,
        "longitude": longitude,
        "photo_url": photoUrl,
        "device_model": deviceModel,
        "device_id": deviceId,
        "time": time,
      },
      "user": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "email": FirebaseAuth.instance.currentUser!.email,
      },
    });
  }

  checkout({
    required String deviceModel,
    required String deviceId,
    required double latitude,
    required double longitude,
    required String time,
    required String photoUrl,
  }) async {
    await FirebaseFirestore.instance
        .collection("attendances")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Timestamp.now().toDate().dateFormat)
        .doc('check-out')
        .set({
      "checkout": true,
      "checkout_date": Timestamp.now(),
      "date": Timestamp.now(),
      "checkout_date_formatted": Timestamp.now().toDate().dateFormat,
      "checkout_info": {
        "latitude": latitude,
        "longitude": longitude,
        "photo_url": photoUrl,
        "device_model": deviceModel,
        "device_id": deviceId,
        "time": time,
      },
      "user": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "email": FirebaseAuth.instance.currentUser!.email,
      },
    });
  }

  Stream<QuerySnapshot<Object?>>? attendanceSnapshot() {
    return FirebaseFirestore.instance
        .collection("attendances")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Timestamp.now().toDate().dateFormat)
        .where("user.uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

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

  Future<bool> isNotInValidDistanceWithCompany({
    required double currentLatitude,
    required double currentLongitude,
  }) async {
    var companySnapshot = await FirebaseFirestore.instance
        .collection("company_profile")
        .doc("main-company")
        .get();

    Map<String, dynamic> companyData =
        companySnapshot.data() as Map<String, dynamic>;

    double targetLatitude = companyData["latitude"];
    double targetLongitude = companyData["longitude"];

    num distance = getDistance(
      currentLatitude,
      currentLongitude,
      targetLatitude,
      targetLongitude,
    );

    return distance > 100;
  }

  num getDistance(
    double currentLatitude,
    double currentLongitude,
    double targetLatitude,
    double targetLongitude,
  ) {
    const int earthRadius = 6371000;

    double lat1 = radians(currentLatitude);
    double lon1 = radians(currentLongitude);
    double lat2 = radians(targetLatitude);
    double lon2 = radians(targetLongitude);

    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    num c = 2 * atan2(sqrt(a), sqrt(1 - a));
    num distance = earthRadius * c;

    return distance;
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }
}
