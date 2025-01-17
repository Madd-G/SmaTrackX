import 'package:smatrackx/core.dart';

class AttendanceService {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> checkIn({
    required String deviceModel,
    required String deviceId,
    required double latitude,
    required double longitude,
    required String time,
    required String photoUrl,
    required int checkInOrder,
    required String status,
    required double distance,
  }) async {
    String currentDate = DateTime.now().yearMonthDay();

    final currentData = await FirebaseFirestore.instance
        .collection("attendances")
        .doc(uid)
        .get();

    Map<String, dynamic> newData = {
      currentDate: {
        "checkInInfo": {
          "latitude": latitude,
          "longitude": longitude,
          "photoUrl": photoUrl,
          "deviceModel": deviceModel,
          "deviceId": deviceId,
          "time": time,
          "checkInOrder": checkInOrder,
          "status": status,
          "distance": distance,
        },
        "uid": uid,
        "date": DateTime.now().yearMonthDay(),
        // "date": DateTime(2024, 3, 1).yearMonthDay(),
        "isCheckedOut": false,
      }
    };

    if (currentData.exists) {
      newData.addAll(currentData.data() as Map<String, dynamic>);
    }

    await FirebaseFirestore.instance
        .collection("attendances")
        .doc(uid)
        .set(newData);
  }

  Future<void> checkOut({
    required String deviceModel,
    required String deviceId,
    required double latitude,
    required double longitude,
    required String time,
    required String photoUrl,
    required int checkOutOrder,
    required String status,
    required double distance,
  }) async {
    String currentDate = DateTime.now().yearMonthDay();

    final currentData = await FirebaseFirestore.instance
        .collection("attendances")
        .doc(uid)
        .get();

    Map<String, dynamic> newDateData = {
      "isCheckedOut": true,
    };

    if (currentData.exists) {
      Map<String, dynamic> currentDataMap =
          currentData.data() as Map<String, dynamic>;

      if (currentDataMap.containsKey(currentDate) &&
          currentDataMap[currentDate].containsKey("checkInInfo")) {
        newDateData["checkOutInfo"] = {
          "latitude": latitude,
          "longitude": longitude,
          "photoUrl": photoUrl,
          "deviceModel": deviceModel,
          "deviceId": deviceId,
          "time": time,
          "checkOutOrder": checkOutOrder,
          "status": status,
          "distance": distance,
        };

        currentDataMap[currentDate].addAll(newDateData);

        await FirebaseFirestore.instance
            .collection("attendances")
            .doc(uid)
            .update(currentDataMap);
      } else {
        return;
      }
    } else {
      return;
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> attendanceSnapshot() {
    return FirebaseFirestore.instance.doc('attendances/$uid').snapshots();
  }

  Future<bool> isNotInValidDistanceWithCompany({
    required double currentLatitude,
    required double currentLongitude,
  }) async {
    var companySnapshot = await FirebaseFirestore.instance
        .collection("company")
        .doc("J5M0OUVH6yQ7iQyoGw5z8NlBSNH2")
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

    // TODO: set radius based on company radius
    return distance > 200;
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
