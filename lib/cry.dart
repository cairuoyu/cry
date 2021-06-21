/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:flutter/material.dart';

import 'routes/cry_route.dart';

class Cry {
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
        initialEntries: [
          OverlayEntry(builder: (c) => child ?? Container()),
        ],
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
}
