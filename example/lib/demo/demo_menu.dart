
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var result = CryMenu(
      child: ListTile(
        title: Text('右键或长按'),
      ),
      onSelected: (v) {
        print(v);
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 'a',
          child: ListTile(
            title: Text('Close All'),
          ),
        ),
        PopupMenuItem(
          value: 'b',
          child: ListTile(
            title: Text('Close Others'),
          ),
        ),
      ],
      // child: tabContent,
    );
    return result;
  }
}
