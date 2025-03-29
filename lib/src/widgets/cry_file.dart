/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description: 

import 'package:cry/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:dio/dio.dart';

class CryFile extends StatefulWidget {
  final Function(MultipartFile)? onSaved;
  final String? initFileUrl;
  final String? buttonLabel;
  final String? tip;
  final List<String>? allowedExtensions;

  const CryFile({
    Key? key,
    this.onSaved,
    this.initFileUrl,
    this.buttonLabel,
    this.tip,
    this.allowedExtensions,
  }) : super(key: key);

  @override
  _CryFileState createState() => _CryFileState();
}

class _CryFileState extends State<CryFile> {
  String? content = '';

  @override
  void initState() {
    initContent();

    super.initState();
  }

  initContent() async {
    if (widget.initFileUrl?.isEmpty ?? true) {
      return;
    }
    var res;
    try {
      res = await Dio().get(widget.initFileUrl!);
    } catch (e) {
      print('请求文件出错：[' + widget.initFileUrl! + ']' + e.toString());
      return;
    }
    content = res.data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var result = Expanded(
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CryButton(
                iconData: Icons.file_download,
                label: widget.buttonLabel,
                onPressed: pickFile,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.tip ?? (widget.allowedExtensions == null ? '' : '支持格式：' + widget.allowedExtensions.toString()),
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
          Expanded(
            child: Card(
              child: Markdown(data: content!),
            ),
          ),
        ],
      ),
    );
    return result;
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.allowedExtensions ?? ['txt'],
    );

    if (result == null) {
      return;
    }
    var bytes = result.files.first.bytes!;
    String? filename = result.files.first.name;
    MultipartFile file = MultipartFile.fromBytes(bytes, filename: filename);
    await widget.onSaved!(file);
    setState(() {
      content = String.fromCharCodes(bytes);
    });
  }
}
