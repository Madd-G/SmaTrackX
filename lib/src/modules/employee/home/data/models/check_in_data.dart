class CheckInData {
  final String date;
  final String uid;
  final CheckInInfo checkInInfo;
  final CheckOutInfo checkOutInfo;

  CheckInData({
    required this.date,
    required this.uid,
    required this.checkInInfo,
    required this.checkOutInfo,
  });

  factory CheckInData.fromMap(Map<String, dynamic> map) {
    return CheckInData(
      date: map['date'],
      uid: map['uid'],
      checkInInfo: CheckInInfo.fromMap(map['checkInInfo']),
      checkOutInfo: CheckOutInfo.fromMap(map['checkOutInfo']),
    );
  }
}

class CheckInInfo {
  final String photoUrl;
  final int checkInOrder;
  final double latitude;
  final String time;
  final String deviceId;
  final double longitude;
  final String status;

  CheckInInfo({
    required this.photoUrl,
    required this.checkInOrder,
    required this.latitude,
    required this.time,
    required this.deviceId,
    required this.longitude,
    required this.status,
  });

  factory CheckInInfo.fromMap(Map<String, dynamic> map) {
    return CheckInInfo(
      photoUrl: map['photoUrl'],
      checkInOrder: map['checkInOrder'],
      latitude: map['latitude'],
      time: map['time'],
      deviceId: map['deviceId'],
      longitude: map['longitude'],
      status: map['status'],
    );
  }
}

class CheckOutInfo {
  final String photoUrl;
  final int checkOutOrder;
  final bool isCheckedOut;
  final double latitude;
  final String time;
  final String deviceId;
  final String status;
  final double longitude;

  CheckOutInfo({
    required this.photoUrl,
    required this.checkOutOrder,
    required this.isCheckedOut,
    required this.latitude,
    required this.time,
    required this.deviceId,
    required this.status,
    required this.longitude,
  });

  factory CheckOutInfo.fromMap(Map<String, dynamic> map) {
    return CheckOutInfo(
      photoUrl: map['photoUrl'],
      checkOutOrder: map['checkOutOrder'],
      isCheckedOut: map['isCheckedOut'],
      latitude: map['latitude'],
      time: map['time'],
      deviceId: map['deviceId'],
      status: map['status'],
      longitude: map['longitude'],
    );
  }
}
