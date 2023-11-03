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
    if (!await doValidate(photoUrl: photoUrl, position: position)) {
      return;
    }
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
    if (!await doValidate(photoUrl: photoUrl, position: position)) {
      return;
    }
    await AttendanceService().checkout(
      deviceModel: deviceModel,
      deviceId: deviceId,
      latitude: position.latitude,
      longitude: position.longitude,
      time: time,
      photoUrl: photoUrl,
    );
  }

  Future<bool> doValidate({
    required String photoUrl,
    required Position position,
  }) async {
    if (await isNotInValidDistance(position)) {
      debugPrint('isNotInValidDistance');
      return false;
    }
    if (await SecurityService().isNotSafeDevice()) {
      debugPrint('isNotSafeDevice');
      return false;
    }
    if (await SecurityService().isNoFaceDetected(photoUrl)) {
      debugPrint('isNoFaceDetected');
      return false;
    }
    return true;
  }

  Future<bool> isNotInValidDistance(Position position) async {
    return await AttendanceService().isNotInValidDistanceWithCompany(
      currentLatitude: position.latitude,
      currentLongitude: position.longitude,
    );
  }
}
