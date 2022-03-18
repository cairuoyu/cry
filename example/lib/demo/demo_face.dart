import 'dart:io';

import 'package:cry/common/application_context.dart';
import 'package:cry/common/face_recognition.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 20220318
/// @version: 1.0
/// @description:
class DemoFace extends StatefulWidget {
  @override
  _DemoFaceState createState() => _DemoFaceState();
}

class _DemoFaceState extends State<DemoFace> {
  bool isFaceRecognition = false;
  String? imagePath;
  CameraImage? cameraImage;
  Face? face;

  @override
  Widget build(BuildContext context) {
    var a = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (this.imagePath != null) SizedBox(width: 100, child: Image.file(File(this.imagePath!))),
        ApplicationContext.instance.cameras.length == 0
            ? Text('没有相机')
            : TextButton(
                child: Text(
                  '注册人脸',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    this.isFaceRecognition = true;
                  });
                })
      ],
    );
    var f = FaceRecognition(onFountFace: (CameraImage cameraImage, String imagePath, List<Face> faces) {
      setState(() {
        this.isFaceRecognition = false;
        this.imagePath = imagePath;
        this.cameraImage = cameraImage;
        this.face = faces[0];
      });
    }, onBack: () {
      setState(() {
        this.isFaceRecognition = false;
      });
    });
    var result = isFaceRecognition ? f : a;
    return result;
  }
}
