import 'dart:io';
import 'dart:typed_data';
import 'package:cry/model/image_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'cry_dialog.dart';
import 'cry_button.dart';


class CryImageUpload extends StatefulWidget {
  CryImageUpload({
    this.fileList,
    this.onUpload,
    this.updateAreaSize = 200,
    this.updateAreaDefault,
  });

  final Function onUpload;
  final List<String> fileList;
  final double updateAreaSize;
  final Widget updateAreaDefault;

  @override
  CryImageUploadState createState() => CryImageUploadState();
}

class CryImageUploadState extends State<CryImageUpload> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PickedFile pickedFile;
  final ImagePicker imagePicker = ImagePicker();
  ImageModel image = ImageModel();
  Uint8List imageBytes;
  final limitMessage = '图片大小不能超过10M';
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var background = Container(
      width: widget.updateAreaSize + 2,
      height: widget.updateAreaSize + 2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
    );

    var tools = Opacity(
      opacity: this.isHover ? 1.0 : 0,
      child: Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            CryButton(
              iconData: Icons.add,
              onPressed: () => pickImage(),
            ),
          ],
        ),
        width: widget.updateAreaSize,
        height: widget.updateAreaSize,
      ),
    );
    var image = Opacity(
      opacity: this.isHover ? 0.4 : 1.0,
      child: Container(
        padding: EdgeInsets.all(2),
        child: previewImage(),
        width: widget.updateAreaSize,
        height: widget.updateAreaSize,
      ),
    );
    var imageAndTools = InkWell(
      onTap: () {},
      onHover: (v) {
        setState(() {
          this.isHover = v;
        });
      },
      child: Stack(
        children: [background, image, tools],
      ),
    );
    var result = Wrap(
      children: <Widget>[
        imageAndTools,
      ],
    );

    return result;
  }

  pickImage() async {
    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    imageBytes = await pickedFile.readAsBytes();
    if (imageBytes.length > 1000 * 1000 * 10) {
      cryAlert(context, limitMessage);
      pickedFile = null;
      imageBytes = null;
      setState(() {});
      return;
    }

    if (pickedFile != null) {
      widget.onUpload(imageBytes);
    }
  }

  Widget previewImage() {
    if (pickedFile != null) {
      if (kIsWeb) {
        return Image.network(pickedFile.path);
      } else {
        return Image.file(File(pickedFile.path));
      }
    }
    if (widget.fileList != null && widget.fileList.length > 0 && widget.fileList[0] != null) {
      return Image.network(widget.fileList[0]);
    } else {
      return widget.updateAreaDefault ?? Container();
    }
  }
}
