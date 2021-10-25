import 'package:cry/common/application_context.dart';
import 'package:cry/cry.dart';
import 'package:cry/cry_logger.dart';
import 'package:cry/generated/l10n.dart';
import 'package:cry/routes/cry_route_Information_parser.dart';
import 'package:cry/routes/cry_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'demo/demo_button.dart';
import 'demo/demo_form.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationContext.instance.init();
  print('loggerType:');
  CryLogger.error('error');
  CryLogger.info('info');
  CryLogger.debug('debug');
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
      builder: Cry.init,
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
