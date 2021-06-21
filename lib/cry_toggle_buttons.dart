/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/vo/select_option_vo.dart';
import 'package:flutter/material.dart';


class CryToggleButtons extends StatefulWidget {
  final List<SelectOptionVO> options;
  final Object? defaultValue;
  final double? fontSize;
  final ValueChanged? afterOnPress;
  CryToggleButtons(this.options, {this.defaultValue, this.fontSize, this.afterOnPress});
  @override
  CryToggleButtonsState createState() => CryToggleButtonsState();
}

class CryToggleButtonsState extends State<CryToggleButtons> {
  late List<bool> isSelected;
  @override
  void initState() {
    super.initState();
    this.isSelected = widget.options.map((e) => widget.defaultValue == e.value).toList();
  }

  @override
  Widget build(BuildContext context) {
    var list = widget.options
        .map((e) => Padding(
              child: Text(
                e.label!,
                style: TextStyle(fontSize: widget.fontSize),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
            ))
        .toList();
    return ToggleButtons(
      children: list,
      onPressed: (index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            setState(() {
              isSelected[i] = i == index;
            });
          }
          widget.afterOnPress!(widget.options[index].value);
        });
      },
      isSelected: isSelected,
    );
  }
}
