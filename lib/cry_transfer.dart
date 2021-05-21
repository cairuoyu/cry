import 'package:flutter/material.dart';

import 'cry_button.dart';

class CryTransfer extends StatefulWidget {
  CryTransfer({Key? key, this.left, this.right, this.toRight, this.toLeft}) : super(key: key);
  final Widget? left;
  final Widget? right;
  final VoidCallback? toRight;
  final VoidCallback? toLeft;

  @override
  _CryTransferState createState() => _CryTransferState();
}

class _CryTransferState extends State<CryTransfer> {
  @override
  Widget build(BuildContext context) {
    var buttonBar = Container(
      width: 60,
      child: ButtonBar(
        children: [
          CryButton(iconData: Icons.arrow_forward, onPressed: widget.toRight),
          CryButton(iconData: Icons.arrow_back, onPressed: widget.toLeft),
        ],
      ),
    );
    var result = Row(
      children: [
        widget.left!,
        buttonBar,
        widget.right!,
      ],
    );
    return result;
  }
}
