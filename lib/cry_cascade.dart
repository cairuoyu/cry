import 'package:cry/utils/collection_utils.dart';
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
  @override
  Widget build(BuildContext context) {
    var result = selectList(widget.data);

    return result;
  }

  selectList(list) {
    var listView = ListView.builder(
      itemCount: list.length,
      itemBuilder: (c, i) {
        var d = list[i];
        var result = CollectionUtils.isEmpty(d["children"])
            ? ListTile(
                title: Text(d["name"].toString()),
              )
            : ListTile(
                title: Text(d["name"].toString()),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => CryCascade(data: d["children"], title: d['name']))),
                trailing: Icon(Icons.chevron_right),
              );
        return result;
      },
    );
    var result = Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: listView,
    );
    return result;
  }
}
