import 'package:SmaTrackX/core.dart';

class CheckInDataModel {
  final String date;
  final String uid;
  final bool isCheckedOut;
  final CheckInInfoModel checkInInfo;
  final CheckOutInfoModel? checkOutInfo;

  CheckInDataModel({
    required this.date,
    required this.uid,
    required this.isCheckedOut,
    required this.checkInInfo,
    required this.checkOutInfo,
  });

  factory CheckInDataModel.fromFirestore(Map<String, dynamic> map) {
    return CheckInDataModel(
      date: map['date'],
      uid: map['uid'],
      isCheckedOut: map['isCheckedOut'],
      checkInInfo: CheckInInfoModel.fromFirestore(map['checkInInfo']),
      checkOutInfo: map['checkOutInfo'] != null
          ? CheckOutInfoModel.fromFirestore(map['checkOutInfo'])
          : null,
    );
  }
}

