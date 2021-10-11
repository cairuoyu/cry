
import 'package:cry/common/keep_alive_wrapper.dart';
import 'package:example/demo/demo_message.dart';
import 'package:example/demo/demo_routes.dart';
import 'package:flutter/material.dart';

import 'demo/demo_button.dart';
import 'demo/demo_data_table.dart';
import 'demo/demo_file.dart';
import 'demo/demo_form.dart';
import 'demo/demo_image_upload.dart';
import 'demo/demo_list_view.dart';
import 'demo/demo_menu.dart';
import 'demo/demo_tree_table.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var tabs = [
      Tab(child: Text('Form')),
      Tab(child: Text('Button')),
      Tab(child: Text('Menu')),
      Tab(child: Text('ImageUpload')),
      Tab(child: Text('DataTable')),
      Tab(child: Text('TreeTable')),
      Tab(child: Text('ListView')),
      Tab(child: Text('File')),
      Tab(child: Text('Routes')),
      Tab(child: Text('Message')),
    ];
    var tabViews = [
      KeepAliveWrapper(child: DemoForm()),
      DemoButton(),
      DemoMenu(),
      DemoImageUpload(),
      DemoDataTable(),
      DemoTreeTable(),
      DemoListView(),
      DemoFile(),
      DemoRoutes(),
      DemoMessage(),
    ];
    var result = DefaultTabController(
      // initialIndex: 2,
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
