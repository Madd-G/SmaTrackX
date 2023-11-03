import 'package:SmaTrackX/core.dart';

part 'attendance_event.dart';

part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(EmployeeAttendanceInitial()) {
    on<CheckInEvent>((event, emit) {
      const CircularProgressIndicator();

      doCheckIn(
        photoUrl: event.photoUrl,
        position: event.position,
        deviceModel: event.deviceModel,
        deviceId: event.deviceId,
        time: event.time,
      );
    });

    on<CheckOutEvent>((event, emit) {
      const CircularProgressIndicator();
      doCheckOut(
        photoUrl: event.photoUrl,
        position: event.position,
        deviceModel: event.deviceModel,
        deviceId: event.deviceId,
        time: event.time,
      );
    });
  }

  doCheckIn({
    required String photoUrl,
    required String deviceModel,
    required Position position,
    required String deviceId,
    required String time,
  }) async {
    await AttendanceService().checkIn(
      deviceModel: deviceModel,
      deviceId: deviceId,
      latitude: position.latitude,
      longitude: position.longitude,
      time: time,
      photoUrl: photoUrl,
    );

    // (mounted) {
    //   Navigator.pop(context);
    //   Navigator.pushNamed(context, HomeScreen.routeName);
    // };
  }

  doCheckOut({
    required String photoUrl,
    required String deviceModel,
    required Position position,
    required String deviceId,
    required String time,
  }) async {
    await AttendanceService().checkout(
      deviceModel: deviceModel,
      deviceId: deviceId,
      latitude: position.latitude,
      longitude: position.longitude,
      time: time,
      photoUrl: photoUrl,
    );

    // (mounted) {
    //   Navigator.pop(context);
    //   Navigator.pushNamed(context, HomeScreen.routeName);
    // };
  }
}
