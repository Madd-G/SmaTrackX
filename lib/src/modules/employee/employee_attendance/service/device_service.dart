import 'package:smatrackx/core.dart';

class DeviceService {
  Future<dynamic> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
