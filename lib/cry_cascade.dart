import 'package:cry/cry_buttons.dart';
import 'package:flutter/material.dart';

class CryCascade extends StatefulWidget {
  final List<Map<String, Object>> data;
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
  List<Page> pages = [];

  @override
  void initState() {
    pages = [
      CascadePage(
        key: UniqueKey(),
        data: widget.data,
        title: widget.title,
        to: addPage,
        ok: (v) => Navigator.pop(context, v),
      ),
    ];
    super.initState();
  }

  removeLastPage() {
    setState(() {
      pages.removeLast();
    });
  }

  addPage(data, title) {
    setState(() {
      pages.add(CascadePage(
        key: UniqueKey(),
        title: title,
        data: data,
        to: addPage,
        ok: (v) => Navigator.pop(context, v),
      ));
    });
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
  final List<Map<String, Object>> data;
  final String? title;
  final Function to;
  final Function ok;

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
        var result = d['children'] == null
            ? ListTile(
                title: Text(d["name"].toString()),
                onTap: () {
                  ok(d);
                },
              )
            : ListTile(
                title: Text(d["name"].toString()),
                onTap: () {
                  to(d['children'], d['name']);
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
            actions: [CryButtons.cancel(context, () => ok(null))],
          ),
          body: listView,
        );
      },
    );
    return result;
  }
}
