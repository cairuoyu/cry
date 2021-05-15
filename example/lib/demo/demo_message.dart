import 'package:cry/cry.dart';
import 'package:cry/utils/cry_utils.dart';
import 'package:flutter/material.dart';

class DemoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        CryButton(
          iconData: Icons.message,
          label: 'testMessage',
          onPressed: () => CryUtils.message('message'),
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
    CryUtils.loading();
    await Future.delayed(Duration(seconds: 1));
    CryUtils.loaded();
  }
}
