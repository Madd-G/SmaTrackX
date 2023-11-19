part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceState {}

class EmployeeAttendanceInitial extends AttendanceState {}

class EmployeeAttendanceLoading extends AttendanceState {}

class EmployeeAttendanceSuccessCheckIn extends AttendanceState {}

class EmployeeAttendanceSuccessCheckOut extends AttendanceState {}

class EmployeeAttendanceFailed extends AttendanceState {}
