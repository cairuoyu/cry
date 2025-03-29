/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:flutter/material.dart';

class CryFormField extends StatefulWidget {
  final double? width;
  final double? padding;
  final Function(CryFormFieldState) builder;

  CryFormField({
    Key? key,
    required this.builder,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CryFormFieldState();
}

class CryFormFieldState extends State<CryFormField> {
  didChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding ?? 20.0),
      width: widget.width ?? double.infinity,
      child: widget.builder(this),
    );
  }
}
