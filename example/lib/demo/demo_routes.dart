import 'package:cry/cry.dart';
import 'package:cry/routes/cry.dart';
import 'package:flutter/material.dart';

class DemoRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        CryButton(
          iconData: Icons.reply,
          label: 'testButton',
          onPressed: () => Cry.pushNamed('/button'),
        ),
      ],
    );
    return buttons;
  }
}
