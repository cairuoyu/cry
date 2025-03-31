import 'package:cry/model.dart';
import 'package:cry/utils.dart';
import 'package:cry/vo.dart';
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoTreeTable extends StatefulWidget {
  @override
  _DemoTreeTableState createState() => _DemoTreeTableState();
}

class _DemoTreeTableState extends State<DemoTreeTable> {
  var data = TreeUtil.toTreeVOList([
    TestTreeModel(id: '0', c1: 'c1-value0', c2: 'c2-value0'),
    TestTreeModel(id: '1', pid: '0', c1: 'c1-value1', c2: 'c2-value1'),
    TestTreeModel(id: '11', pid: '1', c1: 'c11-value11', c2: 'c2-value11'),
    TestTreeModel(id: '2', pid: '0', c1: 'c1-value2', c2: 'c2-value2'),
  ]);

  @override
  Widget build(BuildContext context) {
    List<CryTreeTableColumnData> columnData = [
      CryTreeTableColumnData(label: '列3', getCell: (TestTreeModel v) => Icon(Icons.map), width: 100),
      CryTreeTableColumnData(label: '列1', getCell: (TestTreeModel v) => Text(v.c1??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
      CryTreeTableColumnData(label: '列2', getCell: (TestTreeModel v) => Text(v.c2??'--')),
    ];

    var treeTable = CryTreeTable(
      tableWidth: 3000,
      getRowOper: (v, parent) => [
        CryButton(
          iconData: Icons.delete,
          onPressed: () => LoggerUtil.info('test'),
        )
      ],
      columnData: columnData,
      data: data,
      onSelected: (TreeVO<TestTreeModel>? v) {
        this.setState(() {});
      },
    );
    return treeTable;
  }
}
