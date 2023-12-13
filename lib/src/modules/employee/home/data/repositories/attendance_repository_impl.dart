import 'package:smatrackx/core.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource _remoteDataSource;

  AttendanceRepositoryImpl(this._remoteDataSource);

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAttendanceHistorySnapshot(
      String uid) {
    return _remoteDataSource.getAttendanceHistorySnapshot(uid);
  }
}
