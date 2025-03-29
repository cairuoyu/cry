/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:flutter/material.dart';

class CryMenu<T> extends StatefulWidget {
  final Widget? child;
  final PopupMenuItemBuilder<T>? itemBuilder;
  final PopupMenuItemSelected<T>? onSelected;
  final PopupMenuCanceled? onCanceled;

  const CryMenu({
    Key? key,
    this.child,
    this.itemBuilder,
    this.onCanceled,
    this.onSelected,
  }) : super(key: key);

  @override
  _CryMenuState<T> createState() => _CryMenuState<T>();
}

class _CryMenuState<T> extends State<CryMenu<T>> {
  late Offset position;
  RenderBox? overlay;

  @override
  Widget build(BuildContext context) {
    var result = GestureDetector(
      onLongPressStart: (LongPressStartDetails details) {
        position = details.globalPosition;
      },
      onLongPress: () {
        overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
        showCryMenu();
      },
      child: Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: (event) {
          if (event.buttons == 2) {
            position = event.position;
            overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
            showCryMenu();
          }
        },
        child: widget.child,
      ),
    );
    return result;
  }

  showCryMenu() {
    List<PopupMenuEntry<T>> items = widget.itemBuilder!(context);
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        position & Size.zero,
        Offset.zero & overlay!.size,
      ),
      items: items,
    ).then<void>((T? newValue) {
      if (!mounted) return null;
      if (newValue == null) {
        if (widget.onCanceled != null) widget.onCanceled!();
        return null;
      }
      if (widget.onSelected != null) widget.onSelected!(newValue);
    });
  }
}
