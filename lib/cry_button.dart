import 'package:flutter/material.dart';

class CryButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? tip;
  final EdgeInsets? padding;
  final Color? iconColor;

  CryButton({this.label, this.iconColor = Colors.blue, this.iconData, this.onPressed, this.tip, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget result;
    if (iconData != null) {
      if (label == null) {
        result = IconButton(
          icon: Icon(
            iconData,
            color: iconColor,
          ),
          onPressed: onPressed,
        );
      } else {
        result = ElevatedButton.icon(
          icon: Icon(
            iconData,
            color: iconColor,
          ),
          label: Text(this.label!),
          onPressed: onPressed,
        );
      }
    } else {
      result = ElevatedButton(
        child: Text(this.label ?? ''),
        onPressed: onPressed,
      );
    }
    if (this.padding != null) {
      result = Container(padding: this.padding, child: result);
    }

    if (tip != null) {
      result = Tooltip(
        child: result,
        message: tip!,
      );
    }
    return result;
  }
}
