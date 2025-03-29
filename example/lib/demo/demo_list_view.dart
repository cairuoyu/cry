import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoListView extends StatefulWidget {
  @override
  _DemoListViewState createState() => _DemoListViewState();
}

class _DemoListViewState extends State<DemoListView> {
  @override
  Widget build(BuildContext context) {
    var listView = CryListView(
      appBar: AppBar(title: Text('listViewDemo'),actions: [CryButtons.reset(context, (){})],),
      count: 50,
      getCell: (index) {
        return ListTile(
          title: Text('test-' + index.toString()),
        );
      },
    );
    var result = Container(
      height: 500,
      child: listView,
    );
    return result;
  }
}
