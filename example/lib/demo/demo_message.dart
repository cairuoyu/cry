import 'package:cry/utils.dart';
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = OverflowBar(
      alignment: MainAxisAlignment.start,
      children: [
        CryButton(
          iconData: Icons.message,
          label: 'testMessage',
          onPressed: () => CryUtil.message('message'),
        ),
        CryButton(
          iconData: Icons.local_airport,
          label: 'testLoading',
          onPressed: () {
            load();
            load();
          },
        ),
      ],
    );
    return buttons;
  }

  void load() async {
    CryUtil.loading();
    await Future.delayed(Duration(seconds: 1));
    CryUtil.loaded();
  }
}
