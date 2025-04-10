/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/utils.dart';
import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  final Widget? child;

  const KeepAliveWrapper({Key? key, this.child}) : super(key: key);

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    LoggerUtil.debug(widget.child!.toStringShort() + '--initState');
    super.initState();
  }

  @override
  void dispose() {
    LoggerUtil.debug(widget.child!.toStringShort() + '--disponse');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoggerUtil.debug(widget.child!.toStringShort() + '--build');
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => true;
}
