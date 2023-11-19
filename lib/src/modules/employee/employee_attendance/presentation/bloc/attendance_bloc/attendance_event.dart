part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceEvent {}

class CheckInEvent extends AttendanceEvent {
  final String photoUrl;
  final Position position;
  final String deviceModel;
  final String currentDate;
  final String time;
  final String deviceId;
  final int checkInOrder;
  final String status;
  final double distance;

  CheckInEvent({
    required this.photoUrl,
    required this.position,
    required this.deviceModel,
    required this.currentDate,
    required this.time,
    required this.deviceId,
    required this.checkInOrder,
    required this.status,
    required this.distance,
  });
}

class CheckOutEvent extends AttendanceEvent {
  final String photoUrl;
  final Position position;
  final String deviceModel;
  final String currentDate;
  final String time;
  final String deviceId;
  final int checkOutOrder;
  final String status;
  final double distance;

  CheckOutEvent({
    required this.photoUrl,
    required this.position,
    required this.deviceModel,
    required this.currentDate,
    required this.time,
    required this.deviceId,
    required this.checkOutOrder,
    required this.status,
    required this.distance,
  });
}
