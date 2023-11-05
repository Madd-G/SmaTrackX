import 'package:SmaTrackX/core.dart';

extension DateTimeExt on DateTime {
  String get clockFormat {
    final now = DateTime.now();
    return DateFormat("H:mm:ss").format(now);
  }

  String get dateFormat {
    final now = DateTime.now();
    return DateFormat("dd MMMM yyyy").format(now);
  }
}
