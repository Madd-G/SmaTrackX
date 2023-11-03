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

  CheckInEvent(
      {required this.photoUrl,
      required this.position,
      required this.deviceModel,
      required this.currentDate,
      required this.time,
      required this.deviceId});
}

class CheckOutEvent extends AttendanceEvent {
  final String photoUrl;
  final Position position;
  final String deviceModel;
  final String currentDate;
  final String time;
  final String deviceId;

  CheckOutEvent(
      {required this.photoUrl,
      required this.position,
      required this.deviceModel,
      required this.currentDate,
      required this.time,
      required this.deviceId});
}
