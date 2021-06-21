/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'dart:io';
import 'dart:typed_data';
import 'package:cry/model/image_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'cry_dialog.dart';
import 'cry_button.dart';
import 'generated/l10n.dart';

class CryImageUpload extends StatefulWidget {
  CryImageUpload({
    this.fileList,
    this.onUpload,
    this.updateAreaSize = 200,
    this.updateAreaDefault,
  });

  final Function(Uint8List)? onUpload;
  final List<String?>? fileList;
  final double updateAreaSize;
  final Widget? updateAreaDefault;

  @override
  CryImageUploadState createState() => CryImageUploadState();
}

class CryImageUploadState extends State<CryImageUpload> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PickedFile? pickedFile;
  final ImagePicker imagePicker = ImagePicker();
  ImageModel image = ImageModel();
  Uint8List? imageBytes;
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
              onPressed: () => beforePickImage(),
            ),
          ],
        ),
        width: widget.updateAreaSize,
        height: widget.updateAreaSize,
      ),
    );
    var image = Opacity(
      opacity: this.isHover ? 0.4 : 1.0,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(2),
          child: previewImage(),
          width: widget.updateAreaSize,
          height: widget.updateAreaSize,
        ),
        onTap: () => beforePickImage(),
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

  beforePickImage() {
    if (kIsWeb) {
      pickImage(ImageSource.gallery);
      return;
    }

    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              ListTile(
                title: Text(S.of(context).gallery),
                onTap: () => pickImage(ImageSource.gallery, context: context),
              ),
              ListTile(
                title: Text(S.of(context).camera),
                onTap: () => pickImage(ImageSource.camera, context: context),
              )
            ],
          ),
        );
      },
    );
  }

  pickImage(ImageSource source, {BuildContext? context}) async {
    pickedFile = await imagePicker.getImage(source: source);
    imageBytes = await pickedFile!.readAsBytes();
    if (imageBytes!.length > 1000 * 1000 * 10) {
      cryAlert(context!, limitMessage);
      pickedFile = null;
      imageBytes = null;
      setState(() {});
      return;
    }

    if (pickedFile != null && imageBytes != null) {
      widget.onUpload!(imageBytes!);
    }
    setState(() {});
    if (context != null) {
      Navigator.pop(context);
    }
  }

  Widget previewImage() {
    if (pickedFile != null) {
      if (kIsWeb) {
        return Image.network(pickedFile!.path);
      } else {
        return Image.file(File(pickedFile!.path));
      }
    }
    if (widget.fileList != null && widget.fileList!.length > 0 && widget.fileList![0] != null) {
      return Image.network(widget.fileList![0]!);
    } else {
      return widget.updateAreaDefault ?? Container();
    }
  }
}
