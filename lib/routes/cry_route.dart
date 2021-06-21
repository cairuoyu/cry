/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/routes/cry_router_delegate.dart';
import 'package:flutter/material.dart';

class CryRoute {
  CryRoute._();

  static CryRoute? _instance;

  static CryRoute get instance => _getInstance();

  static CryRoute _getInstance() {
    if (_instance == null) {
      _instance = CryRoute._();
    }
    return _instance!;
  }

  late CryRouterDelegate _cryRouterDelegate;

  init(CryRouterDelegate cryRouterDelegate) {
    _cryRouterDelegate = cryRouterDelegate;
  }

  push(Widget widget) => _cryRouterDelegate.push(widget);

  pushNamed(String name) => _cryRouterDelegate.pushNamed(name);

  pushNamedAndRemove(String name) => _cryRouterDelegate.pushNamedAndRemove(name);

  popAndPushNamed(String name) => _cryRouterDelegate.popAndPushNamed(name);

  pop() => _cryRouterDelegate.pop();
}
