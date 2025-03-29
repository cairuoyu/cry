import 'package:camera/camera.dart';
import 'package:cry/common.dart';
import 'package:cry/constants.dart';
import 'package:cry/utils.dart';
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 20220318
/// @version: 1.0
/// @description:
class FaceRecognition extends StatefulWidget {
  FaceRecognition({Key? key, required this.onFountFace, required this.onBack, this.initialDirection = CameraLensDirection.front}) : super(key: key);

  final Function(CameraImage cameraImage, String imagePath, List<Face> faces) onFountFace;
  final Function() onBack;
  final CameraLensDirection initialDirection;

  @override
  _FaceRecognitionState createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  List<CameraDescription> cameras = ApplicationContext.instance.cameras;
  CameraController? _controller;
  CommonStatus status = CommonStatus.un;
  late final camera;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == widget.initialDirection) {
        camera = cameras[i];
      }
    }
    _startCamera();
  }

  @override
  void dispose() {
    _stopCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }
    var result = Column(
      children: [
        CameraPreview(_controller!),
        CryButtonBar(children: [
          CryButton(
            label: '返回',
            onPressed: () {
              widget.onBack();
            },
          ),
          CryButton(
            label: '开始识别',
            onPressed: () {
              this.status = CommonStatus.ing;
            },
          ),
        ]),
      ],
    );
    return result;
  }

  Future _startCamera() async {
    _controller = CameraController(
      camera,
      ResolutionPreset.low,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future _stopCamera() async {
    await _controller?.dispose();
    _controller = null;
  }

  Future _processCameraImage(CameraImage image) async {
    if (status != CommonStatus.ing) {
      return;
    }
    final faces = await FaceUtil.getFaces(camera, image);

    if (status == CommonStatus.success) {
      return;
    }
    print('Found ${faces.length} faces');
    if (faces.length > 0) {
      status = CommonStatus.success;
      await _controller?.stopImageStream();
      // await Future.delayed(Duration(milliseconds: 500));
      XFile file = await _controller!.takePicture();
      widget.onFountFace(image, file.path, faces);
    }
  }
}
