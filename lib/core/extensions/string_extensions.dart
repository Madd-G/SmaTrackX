extension StringExt on String {
  String get displayTime {
    String hour = substring(0, 2);
    final minute = substring(3, 5);

    return '$hour:$minute';
  }
}
