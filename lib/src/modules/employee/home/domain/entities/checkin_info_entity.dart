import 'package:smatrackx/core.dart';

class CheckInInfoEntity extends Equatable {
  final String deviceId;
  final String deviceModel;
  final String time;
  final String status;
  final int checkInOrder;
  final String photoUrl;
  final num latitude;
  final num longitude;
  final num distance;

  const CheckInInfoEntity({
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

  @override
  List<Object?> get props => [
        deviceId,
        deviceModel,
        time,
        status,
        checkInOrder,
        photoUrl,
        latitude,
        longitude,
        distance,
      ];

  @override
  String toString() {
    return 'CheckInInfoEntity {'
        '\n  deviceId: $deviceId,'
        '\n  deviceModel: $deviceModel,'
        '\n  time: $time,'
        '\n  status: $status,'
        '\n  checkInOrder: $checkInOrder,'
        '\n  photoUrl: $photoUrl,'
        '\n  latitude: $latitude,'
        '\n  longitude: $longitude,'
        '\n  distance: $distance'
        '\n}';
  }
}
