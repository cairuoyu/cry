/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/common.dart';
import 'package:flutter/material.dart';

class CryListView extends StatefulWidget {
  final int? count;
  final IntWidgetFunction getCell;
  final VoidCallback? loadMore;
  final RefreshCallback? onRefresh;
  final CryListViewType cryListViewType;
  final AppBar? appBar;

  CryListView({
    Key? key,
    this.count,
    required this.getCell,
    this.loadMore,
    this.cryListViewType = CryListViewType.column,
    this.onRefresh,
    this.appBar,
  }) : super(key: key);

  @override
  CryListViewState createState() => CryListViewState();
}

class CryListViewState extends State<CryListView> {
  ScrollController controller = new ScrollController();
  bool toTopButtonVisible = false;

  @override
  void initState() {
    controller.addListener(() {
      double topLimit = 500;
      if (controller.offset < topLimit && toTopButtonVisible) {
        toTopButtonVisible = false;
        setState(() {});
      } else if (controller.offset > topLimit && !toTopButtonVisible) {
        toTopButtonVisible = true;
        setState(() {});
      }
      if (widget.loadMore != null && controller.position.maxScrollExtent == controller.position.pixels) {
        widget.loadMore!();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listView;
    if (widget.cryListViewType == CryListViewType.column) {
      listView = ListView(
        controller: controller,
        children: List.generate(
          widget.count!,
          ((int index) => widget.getCell(index)),
        ),
      );
    } else {
      double width = MediaQuery.of(context).size.width;
      int columnCount = width ~/ 500 + 1;
      int rowConunt = widget.count! ~/ columnCount + 1;
      listView = ListView(
        controller: controller,
        children: [
          Column(
            children: [
              ...List<Widget>.generate(
                rowConunt,
                (y) {
                  return Row(
                    children: [
                      ...List<Widget>.generate(columnCount, (x) {
                        int index = columnCount * y + x;
                        var card = Padding(padding: EdgeInsets.all(10), child: (index > widget.count! - 1) ? Container() : widget.getCell(index));
                        return Expanded(
                          child: card,
                        );
                      }),
                    ],
                  );
                },
              ),
            ],
          )
        ],
      );
    }
    var result = Scaffold(
      appBar: widget.appBar,
      body: RefreshIndicator(
        child: listView,
        onRefresh: widget.onRefresh ?? () async {},
      ),
      floatingActionButton: !toTopButtonVisible
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                controller.animateTo(
                  .0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            ),
    );
    return result;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum CryListViewType {
  column,
  wrap,
}
