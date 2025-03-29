import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:
class FaceService {
  static final FaceService _faceService = FaceService._internal();

  factory FaceService() {
    return _faceService;
  }

  FaceService._internal();
  String toData(CameraImage cameraImage, Face face) {
    return '';
  }
  loadModel(){}
}
