import 'package:cry/model.dart';
import 'package:cry/utils.dart';
import 'package:cry/widgets.dart';
import 'package:flutter/material.dart';

class DemoDataTable extends StatefulWidget {
  @override
  _DemoDataTableState createState() => _DemoDataTableState();
}

class _DemoDataTableState extends State<DemoDataTable> {
  PageModel page = PageModel(orders: [OrderItemModel(column: 'update_time')], size: 10);
  GlobalKey<CryDataTableState> tableKey = GlobalKey<CryDataTableState>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    CryDataTable table = CryDataTable(
      key: tableKey,
      title: 'User List',
      columns: [
        DataColumn(label: Text('name')),
        DataColumn(label: Text('createTime')),
      ],
      getCells: (Map m) {
        return [
          DataCell(Text(m['name'] ?? '--')),
          DataCell(Text(m['createTime'] ?? '--')),
        ];
      },
      onSelectChanged: (Map selected) {
        this.setState(() {});
      },
      onPageChanged: (int firstRowIndex) {
        page.current = (firstRowIndex ~/ page.size + 1);
        _loadData();
      },
      onRowsPerPageChanged: (int? size) {
        page.size = size ?? page.size;
        page.current = 1;
        _loadData();
      },
    );

    var body = Column(
      children: [
        OverflowBar(
          children: [
            CryButtons.query(context, () => _loadData()),
            CryButton(
                label: 'to page 1',
                onPressed: () {
                  tableKey.currentState?.pageTo(0);
                }),
          ],
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[table],
          ),
        ),
      ],
    );
    return Scaffold(
      body: body,
    );
  }

  _loadData() async {
    ResponseBodyApi responseBodyApi = await HttpUtil.post('/userInfo/page', data: RequestBodyApi(page: page).toMap());
    if(!responseBodyApi.success!){
      return ;
    }
    this.page = PageModel.fromMap(responseBodyApi.data);
    tableKey.currentState?.loadData(page);
  }
}
