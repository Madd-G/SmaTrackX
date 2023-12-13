import 'package:smatrackx/core.dart';

class CheckInDataEntity extends Equatable {
  final String date;
  final String uid;
  final bool isCheckedOut;
  final CheckInInfoEntity checkInInfo;
  final CheckOutInfoEntity? checkOutInfo;

  const CheckInDataEntity({
    required this.date,
    required this.uid,
    required this.isCheckedOut,
    required this.checkInInfo,
    required this.checkOutInfo,
  });

  @override
  List<Object?> get props => [
        date,
        uid,
        isCheckedOut,
        checkInInfo,
        checkOutInfo,
      ];

  @override
  String toString() {
    return 'CheckInDataEntity { '
        '\n date: $date, '
        '\n uid: $uid, '
        '\n isCheckedOut: $isCheckedOut, '
        '\n checkInInfo: $checkInInfo, '
        '\n checkOutInfo: $checkOutInfo '
        '\n}';
  }
}
