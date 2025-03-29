import 'package:cry/utils.dart';
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = OverflowBar(
      alignment: MainAxisAlignment.start,
      children: [
        CryButton(
          iconData: Icons.reply,
          label: 'testButton',
          onPressed: () => CryUtil.pushNamed('/button'),
        ),
      ],
    );
    return buttons;
  }
}
