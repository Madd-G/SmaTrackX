import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  Future<AndroidDeviceInfo> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return androidInfo;
  }
}
