import 'package:cry/common.dart';
import 'package:cry/generated.dart';
import 'package:cry/routes.dart';
import 'package:cry/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/dio_interceptors_example.dart';
import 'demo/demo_button.dart';
import 'demo/demo_form.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationContext.instance.init();
  ApplicationContext.instance.addBean("dioInterceptors", [DioInterceptorsExample()]);
  print('loggerType:');
  LoggerUtil.error('error');
  LoggerUtil.info('info');
  LoggerUtil.debug('debug');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> pageMap = {
      '/': Home(),
      '/button': DemoButton(),
      '/form': DemoForm(),
    };
    return MaterialApp.router(
      key: UniqueKey(),
      title: 'Cry Demo',
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      builder: CryUtil.init,
      localizationsDelegates: [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerDelegate: CryRouterDelegate(pageMap: pageMap),
      routeInformationParser: CryRouteInformationParser(),
    );
  }
}
