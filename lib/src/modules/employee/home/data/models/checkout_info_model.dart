class CheckOutInfoModel {
  final int checkOutOrder;
  final String deviceId;
  final String deviceModel;
  final num distance;
  final num latitude;
  final num longitude;
  final String photoUrl;
  final String status;
  final String time;

  CheckOutInfoModel({
    required this.checkOutOrder,
    required this.deviceId,
    required this.deviceModel,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.photoUrl,
    required this.status,
    required this.time,
  });

  factory CheckOutInfoModel.fromFirestore(Map<String, dynamic> map) {
    return CheckOutInfoModel(
      checkOutOrder: map['checkOutOrder'],
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
