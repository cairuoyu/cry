import 'package:cry/common/page_404.dart';
import 'package:cry/cry.dart';
import 'package:flutter/material.dart';

import 'cry_route.dart';

class CryRouterDelegate extends RouterDelegate<RouteInformation> with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  List<Page> pages = [];
  Map pageMap;

  String? location;

  CryRouterDelegate({required this.pageMap}) {
    CryRoute.instance.init(this);
  }

  @override
  RouteInformation get currentConfiguration {
    return RouteInformation(location: location ?? '/');
  }

  @override
  Widget build(BuildContext context) {
    if (pages.length == 0) {
      return Container();
    }
    return Navigator(
      key: Cry.navigatorKey = navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        pop();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(RouteInformation routeInformation) async {
    pushNamed(routeInformation.location ?? '/');
  }

  pushNamedAndRemove(String name) {
    if (pages.length > 0) {
      pages.clear();
    }
    pushNamed(name);
  }

  popAndPushNamed(String name) {
    if (pages.length > 0) {
      pages.removeLast();
    }
    pushNamed(name);
  }

  pushNamed(String name) {
    var widget = pageMap[name];
    location = name;
    if (widget == null) {
      widget = Page404();
      location = '404';
    }

    pages.add(
      MaterialPage(
        key: UniqueKey(),
        child: widget,
      ),
    );

    notifyListeners();
  }

  push(Widget widget) {}

  pop() {
    pages.removeLast();
    notifyListeners();
  }
}
