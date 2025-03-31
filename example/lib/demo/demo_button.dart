import 'package:cry/utils.dart';
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = OverflowBar(
      alignment: MainAxisAlignment.start,
      children: [
        CryButton(
          iconData: Icons.save,
          label: 'testButton',
          onPressed: () {
            LoggerUtil.info('testButton');
          },
        ),
        CryButtons.query(context, () => LoggerUtil.info('test commonButton')),
        CryButtons.add(context, () => LoggerUtil.info('test commonButton')),
        CryButtons.save(context, () => LoggerUtil.info('test commonButton')),
        CryButtons.commit(context, () => LoggerUtil.info('test commonButton')),
        CryButtons.delete(context, () {
          cryConfirm(context, '确定？', (context) {
            LoggerUtil.info('deleted--');
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
