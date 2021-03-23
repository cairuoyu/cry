import 'package:cry/common/application_context.dart';
import 'package:cry/generated/l10n.dart';
import 'package:example/demo/demo_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'demo/demo_button.dart';
import 'demo/demo_data_table.dart';
import 'demo/demo_form.dart';
import 'demo/demo_image_upload.dart';
import 'demo/demo_list_view.dart';
import 'demo/demo_menu.dart';
import 'demo/demo_tree_table.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationContext.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cry Demo',
      localizationsDelegates: [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('zh'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var tabs = [
      Tab(child: Text('Button')),
      Tab(child: Text('Menu')),
      Tab(child: Text('Form')),
      Tab(child: Text('ImageUpload')),
      Tab(child: Text('DataTable')),
      Tab(child: Text('TreeTable')),
      Tab(child: Text('ListView')),
      Tab(child: Text('File')),
    ];
    var tabViews = [
      DemoButton(),
      DemoMenu(),
      DemoForm(),
      DemoImageUpload(),
      DemoDataTable(),
      DemoTreeTable(),
      DemoListView(),
      DemoFile(),
    ];
    var result = DefaultTabController(
      initialIndex: 2,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cry Demo Home Page'),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: tabViews,
        ),
      ),
    );
    return result;
  }
}
