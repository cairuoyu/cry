
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoImageUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUpload = CryImageUpload(
      updateAreaSize: 200,
      fileList: [null],
      updateAreaDefault: Icon(Icons.person, size: 200),
      onUpload: (imageBytes) {
        print('onUpload');
      },
    );
    return imageUpload;
  }
}
