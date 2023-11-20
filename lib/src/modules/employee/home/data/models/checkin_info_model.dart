class CheckInInfoModel {
  final int checkInOrder;
  final String deviceId;
  final String deviceModel;
  final num distance;
  final num latitude;
  final num longitude;
  final String photoUrl;
  final String status;
  final String time;

  CheckInInfoModel({
    required this.checkInOrder,
    required this.deviceId,
    required this.deviceModel,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.photoUrl,
    required this.status,
    required this.time,
  });

  factory CheckInInfoModel.fromFirestore(Map<String, dynamic> map) {
    return CheckInInfoModel(
      checkInOrder: map['checkInOrder'],
      deviceId: map['deviceId'],
      deviceModel: map['deviceModel'],
      distance: map['distance'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      photoUrl: map['photoUrl'],
      status: map['status'],
      time: map['time'],
    );
  }
}
