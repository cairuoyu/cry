/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/generated.dart';
import 'package:flutter/material.dart';

void cryAlert(BuildContext context, String content) {
  cryAlertWidget(context, Text(content));
}

void cryAlertWidget(BuildContext context, Widget content) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).information),
        scrollable: true,
        content: content,
        actions: <Widget>[
          TextButton(
            child: Text(S.of(context).close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void cryConfirm(BuildContext context, String content, onConfirm) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).information),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(S.of(context).cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(S.of(context).confirm),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm(context);
            },
          ),
        ],
      );
    },
  );
}

cryDialog({
  required BuildContext context,
  required String title,
  Widget? body,
  Future? then,
  double? width,
  double? height,
}) {
  AppBar header = AppBar(
    title: Text(title),
  );
  var result = Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header,
          Expanded(
            child: SingleChildScrollView(
              child: body,
            ),
          ),
        ],
      ));
  return showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: result,
    ),
  );
}
