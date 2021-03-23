import 'package:cry/cry_file.dart';
import 'package:example/api/file_api.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DemoFile extends StatefulWidget {
  @override
  _DemoFileState createState() => _DemoFileState();
}

class _DemoFileState extends State<DemoFile> {
  @override
  Widget build(BuildContext context) {
    var cryFile = CryFile(
      initFileUrl: 'https://www.cairuoyu.com/f/p4/u-20210319102306760-740528803.md',
      onSaved: (MultipartFile file) async {
        FormData formData = FormData.fromMap({"file": file});
        var res = await FileApi.upload(formData);
        print(res.data);
      },
      buttonLabel: '上传文章',
      allowedExtensions: ['md', 'txt'],
      // tip: '支持格式：txt/md',
    );
    return cryFile;
  }
}
