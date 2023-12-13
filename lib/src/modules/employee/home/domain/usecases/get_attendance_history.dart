import 'package:smatrackx/core.dart';

class GetAttendanceHistory {
  final AttendanceRepository _repository;

  GetAttendanceHistory(this._repository);

  Stream<DocumentSnapshot<Map<String, dynamic>>> call(String uid) {
    return _repository.getAttendanceHistorySnapshot(uid);
  }
}
