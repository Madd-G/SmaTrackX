import 'package:SmaTrackX/core.dart';

class CheckOutInfoEntity extends Equatable {
  final String photoUrl;
  final int checkOutOrder;
  final num latitude;
  final num longitude;
  final String time;
  final String deviceId;
  final String deviceModel;
  final String status;
  final num distance;

  const CheckOutInfoEntity({
    required this.photoUrl,
    required this.checkOutOrder,
    required this.latitude,
    required this.longitude,
    required this.time,
    required this.deviceId,
    required this.deviceModel,
    required this.status,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        deviceId,
        deviceModel,
        time,
        status,
        checkOutOrder,
        photoUrl,
        latitude,
        longitude,
        distance,
      ];

  @override
  String toString() {
    return 'CheckOutInfoEntity {'
        '\n  deviceId: $deviceId,'
        '\n  deviceModel: $deviceModel,'
        '\n  time: $time,'
        '\n  status: $status,'
        '\n  checkOutOrder: $checkOutOrder,'
        '\n  photoUrl: $photoUrl,'
        '\n  latitude: $latitude,'
        '\n  longitude: $longitude,'
        '\n  distance: $distance'
        '\n}';
  }
}
