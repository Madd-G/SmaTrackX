import 'package:smatrackx/core.dart';

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
        checkInOrder: event.checkInOrder,
        status: event.status,
        distance: event.distance,
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
          checkOutOrder: event.checkOutOrder,
          status: event.status,
          distance: event.distance);
    });
  }

  doCheckIn({
    required String photoUrl,
    required String deviceModel,
    required Position position,
    required String deviceId,
    required String time,
    required checkInOrder,
    required status,
    required distance,
  }) async {
    showLoading();
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
      checkInOrder: checkInOrder,
      status: status,
      distance: distance,
    );

    hideLoading();
    Get.back();
  }

  doCheckOut({
    required String photoUrl,
    required String deviceModel,
    required Position position,
    required String deviceId,
    required String time,
    required checkOutOrder,
    required status,
    required distance,
  }) async {
    showLoading();
    if (!await doValidate(photoUrl: photoUrl, position: position)) {
      return;
    }
    await AttendanceService().checkOut(
      deviceModel: deviceModel,
      deviceId: deviceId,
      latitude: position.latitude,
      longitude: position.longitude,
      time: time,
      photoUrl: photoUrl,
      checkOutOrder: checkOutOrder,
      status: status,
      distance: distance,
    );

    hideLoading();
    Get.back();
  }

  Future<bool> doValidate({
    required String photoUrl,
    required Position position,
  }) async {
    if (await isNotInValidDistance(position)) {
      hideLoading();
      showInfoDialog("Too far from company :(");
      return false;
    }
    if (await SecurityService().isNotSafeDevice()) {
      hideLoading();
      showInfoDialog("Doesn't work on emulator or rooted devices!");
      return false;
    }
    if (await SecurityService().isNoFaceDetected(photoUrl)) {
      hideLoading();
      showInfoDialog("No face detected!");
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
