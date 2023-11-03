import 'dart:io';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:safe_device/safe_device.dart';

class SecurityService {
  Future<bool> isNotSafeDevice() async {
    bool isJailBroken = await SafeDevice.isJailBroken;
    bool isNotRealDevice = !await SafeDevice.isRealDevice;
    return isJailBroken || isNotRealDevice;
  }

  //url to File
  // convertUrlToFile

  Future<File> convertUrlToFile(String imageUrl) async {
    HttpClient httpClient = HttpClient();
    File file;

    try {
      Uri url = Uri.parse(imageUrl);
      HttpClientRequest request = await httpClient.getUrl(url);
      HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        Directory tempDir = await getTemporaryDirectory();
        String fileName = imageUrl.split("/").last;
        String filePath = '${tempDir.path}/$fileName';

        file = File(filePath);
        IOSink sink = file.openWrite();
        await response.pipe(sink);
        await sink.close();
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      throw Exception('Failed to load image: $e');
    } finally {
      httpClient.close();
    }

    return file;
  }

  Future<bool> isNoFaceDetected(String photoUrl) async {
    File file = await convertUrlToFile(photoUrl);
    final InputImage inputImage = InputImage.fromFile(file);
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final List<Face> faces = await faceDetector.processImage(inputImage);
    return faces.isEmpty;
  }
}
