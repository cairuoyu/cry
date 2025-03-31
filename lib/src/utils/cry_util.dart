/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'dart:io';

import 'package:cry/common.dart';
import 'package:cry/model.dart';
import 'package:cry/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CryUtil {
  static OverlayEntry? loadingOE;

  static GlobalKey<NavigatorState>? navigatorKey;

  static get context {
    if (navigatorKey == null) {
      throw FlutterError('未初始化NavigatorKey');
    }
    return navigatorKey!.currentContext;
  }

  static Widget init(BuildContext context, Widget? child) {
    return Material(
      child: Overlay(
        initialEntries: [OverlayEntry(builder: (c) => child ?? Container())],
      ),
    );
  }

  static pushNamedAndRemove(String name) {
    CryRoute.instance.pushNamedAndRemove(name);
  }

  static popAndPushNamed(String name) {
    CryRoute.instance.popAndPushNamed(name);
  }

  static pushNamed(String name) {
    CryRoute.instance.pushNamed(name);
  }

  static push(Widget widget) {
    CryRoute.instance.push(widget);
  }

  static pop() => CryRoute.instance.pop();

  static void message(String message, {int duration = 5}) {
    if (!kIsWeb && Platform.isWindows) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: duration,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
        webShowClose: true,
      );
    }
  }

  static void loading({bool tapClose = false}) {
    if (loadingOE != null) {
      return;
    }
    var child = Container(
      child:
          tapClose
              ? InkWell(
                child: Center(child: CircularProgressIndicator()),
                onTap: () => loaded(),
              )
              : Center(child: CircularProgressIndicator()),
      decoration: new BoxDecoration(color: Colors.transparent),
    );
    loadingOE = OverlayEntry(builder: (c) => child);

    Overlay.of(context).insert(loadingOE!);
  }

  static void loaded() {
    if (loadingOE == null) {
      return;
    }
    loadingOE!.remove();
    loadingOE = null;
  }

  static CryProperties? getCryProperties() {
    return ApplicationContext.instance.getBean('cryProperties');
  }
}
