/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/cry_buttons.dart';
import 'package:cry/model/cascade_model.dart';
import 'package:flutter/material.dart';

class CryCascade extends StatefulWidget {
  final List<CascadeModel> data;
  final String? title;

  const CryCascade({
    Key? key,
    this.title,
    required this.data,
  }) : super(key: key);

  @override
  _CryCascadeState createState() => _CryCascadeState();
}

class _CryCascadeState extends State<CryCascade> {
  final List<Page> pages = [];
  List<CascadeModel> selectList = [];

  @override
  void initState() {
    addPage(widget.data, widget.title);
    super.initState();
  }

  removeLastPage() {
    setState(() {
      selectList.removeLast();
      pages.removeLast();
    });
  }

  addPage(data, title) {
    pages.add(CascadePage(
      key: UniqueKey(),
      title: title,
      data: data,
      to: to,
      ok: ok,
    ));
  }

  to(CascadeModel data, title) {
    selectList.add(data);
    setState(() {
      addPage(data.children, title);
    });
  }

  ok(v) {
    if (v == null) {
      Navigator.pop(context);
      return;
    }
    selectList.add(v);
    Navigator.pop(context, selectList);
  }

  @override
  Widget build(BuildContext context) {
    var result = Navigator(
      key: UniqueKey(),
      onPopPage: (route, result) {
        removeLastPage();
        return route.didPop(result);
      },
      pages: pages,
    );
    return result;
  }
}

class CascadePage extends Page {
  final List<CascadeModel> data;
  final String? title;
  final Function(CascadeModel, String) to;
  final Function(CascadeModel?) ok;

  CascadePage({
    required LocalKey key,
    required this.data,
    this.title,
    required this.to,
    required this.ok,
  });

  @override
  Route createRoute(BuildContext context) {
    var listView = ListView.builder(
      itemCount: data.length,
      itemBuilder: (c, i) {
        var d = data[i];
        var result = d.children == null
            ? ListTile(
                title: Text(d.name.toString()),
                onTap: () {
                  ok(d);
                },
              )
            : ListTile(
                title: Text(d.name.toString()),
                onTap: () {
                  to(d, d.name);
                },
                trailing: Icon(Icons.chevron_right),
              );
        return result;
      },
    );
    var result = MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title ?? ''),
            actions: [CryButtons.cancel(context, () => ok(null), showLabel: false)],
          ),
          body: listView,
        );
      },
    );
    return result;
  }
}
