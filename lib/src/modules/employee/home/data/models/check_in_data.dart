class CheckInData {
  final String date;
  final String uid;
  final bool isCheckedOut;
  final CheckInInfo checkInInfo;
  final CheckOutInfo? checkOutInfo; // Make it nullable

  CheckInData({
    required this.date,
    required this.uid,
    required this.isCheckedOut,
    required this.checkInInfo,
    required this.checkOutInfo,
  });

  factory CheckInData.fromMap(Map<String, dynamic> map) {
    return CheckInData(
      date: map['date'],
      uid: map['uid'],
      isCheckedOut: map['isCheckedOut'],
      checkInInfo: CheckInInfo.fromMap(map['checkInInfo']),
      checkOutInfo: map['checkOutInfo'] != null
          ? CheckOutInfo.fromMap(map['checkOutInfo'])
          : null,
    );
  }
}

class CheckInInfo {
  final String deviceId;
  final String deviceModel;
  final String time;
  final String status;
  final int checkInOrder;
  final String photoUrl;
  final double latitude;
  final double longitude;
  final double distance;

  CheckInInfo({
    required this.deviceId,
    required this.deviceModel,
    required this.time,
    required this.status,
    required this.checkInOrder,
    required this.photoUrl,
    required this.latitude,
    required this.longitude,
    required this.distance,
  });

  factory CheckInInfo.fromMap(Map<String, dynamic> map) {
    return CheckInInfo(
      photoUrl: map['photoUrl'],
      checkInOrder: map['checkInOrder'],
      latitude: map['latitude'],
      time: map['time'],
      deviceId: map['deviceId'],
      deviceModel: map['deviceModel'],
      longitude: map['longitude'],
      status: map['status'],
      distance: map['distance'],
    );
  }
}

class CheckOutInfo {
  final String photoUrl;
  final int checkOutOrder;
  final double latitude;
  final String time;
  final String deviceId;
  final String deviceModel;
  final String status;
  final double longitude;
  final double distance;

  CheckOutInfo({
    required this.photoUrl,
    required this.checkOutOrder,
    required this.latitude,
    required this.time,
    required this.deviceId,
    required this.deviceModel,
    required this.status,
    required this.longitude,
    required this.distance,
  });

  factory CheckOutInfo.fromMap(Map<String, dynamic> map) {
    return CheckOutInfo(
      photoUrl: map['photoUrl'],
      checkOutOrder: map['checkOutOrder'],
      latitude: map['latitude'],
      time: map['time'],
      deviceId: map['deviceId'],
      deviceModel: map['deviceModel'],
      status: map['status'],
      longitude: map['longitude'],
      distance: map['distance'],
    );
  }
}
