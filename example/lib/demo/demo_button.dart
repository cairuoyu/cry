import 'package:cry/cry_button.dart';
import 'package:cry/cry_buttons.dart';
import 'package:cry/cry_dialog.dart';
import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        CryButton(
          iconData: Icons.save,
          label: 'testButton',
          onPressed: () {
            print('testButton');
          },
        ),
        CryButtons.query(context, () => print('test commonButton')),
        CryButtons.add(context, () => print('test commonButton')),
        CryButtons.save(context, () => print('test commonButton')),
        CryButtons.commit(context, () => print('test commonButton')),
        CryButtons.delete(context, () {
          cryConfirm(context, '确定？', (context) {
            print('deleted--');
          });
        }),
      ],
    );
    return ListView(
      children: [
        buttons,
        ListTile(
          title: CryButton(
            iconData: Icons.ac_unit,
            iconColor: Colors.red,

          ),
        ),
      ],
    );
  }
}
