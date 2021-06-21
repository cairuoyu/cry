/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/common/common_types.dart';
import 'package:flutter/material.dart';

import 'model/page_model.dart';

class CryDataTable extends StatefulWidget {
  CryDataTable({
    Key? key,
    this.title = '',
    this.columns,
    this.getCells,
    this.onPageChanged,
    this.onRowsPerPageChanged,
    this.onSelectChanged,
    this.availableRowsPerPage,
    this.selectable,
  }) : super(key: key);
  final String title;

  final List<int>? availableRowsPerPage;
  final List<DataColumn>? columns;
  final MapDataCellListFunction? getCells;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onRowsPerPageChanged;
  final MapVoidFunction? onSelectChanged;
  final MapBoolFunction? selectable;

  @override
  CryDataTableState createState() => CryDataTableState();
}

class CryDataTableState extends State<CryDataTable> {
  DS ds = DS();
  int? rowsPerPage = 10;
  late List<DataColumn> columns;
  GlobalKey<PaginatedDataTableState> tableKey = GlobalKey<PaginatedDataTableState>();

  @override
  void initState() {
    super.initState();
    ds.getCells = widget.getCells;
    ds.onSelectChanged = widget.onSelectChanged;
    ds.selectable = widget.selectable;

    var indexColumn = DataColumn(label: Text('#'));
    columns = widget.columns ?? [];
    columns.insert(0, indexColumn);
  }

  pageTo(rowIndex) {
    tableKey.currentState!.pageTo(rowIndex);
  }

  loadData(PageModel pageModel) {
    ds.pageModel = pageModel;

    if (pageModel.size != rowsPerPage) {
      setState(() {
        rowsPerPage = pageModel.size;
      });
    } else {
      ds.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    var result = PaginatedDataTable(
      key: tableKey,
      header: Text(widget.title),
      rowsPerPage: rowsPerPage!,
      availableRowsPerPage: widget.availableRowsPerPage ?? [5, 10, 20, 50],
      onPageChanged: widget.onPageChanged,
      onRowsPerPageChanged: (int? v) {
        widget.onRowsPerPageChanged?.call(v ?? 10);
      },
      columns: columns,
      source: ds,
      showCheckboxColumn: true,
    );

    return result;
  }

  List<Map<String, dynamic>> getSelectedList(PageModel page) {
    return page.records.where((v) => v['selected'] ?? false).toList();
  }
}

class DS extends DataTableSource {
  PageModel pageModel = PageModel();
  MapDataCellListFunction? getCells;
  Function? onSelectChanged;
  MapBoolFunction? selectable;

  reload() {
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    var dataIndex = index - pageModel.size * (pageModel.current - 1);
    if (dataIndex >= pageModel.records.length) {
      return null;
    }
    Map<String, dynamic> m = pageModel.records[dataIndex];

    List<DataCell> cells = getCells == null ? [] : getCells!(m);
    cells.insert(0, DataCell(Text((index + 1).toString())));
    bool selected = m['selected'] ?? false;
    return DataRow.byIndex(
      index: index,
      cells: cells,
      selected: selected,
      onSelectChanged: (this.selectable == null ? true : this.selectable!(m))
          ? (v) {
              m['selected'] = v;
              if (onSelectChanged != null) {
                onSelectChanged!(m);
              }
              notifyListeners();
            }
          : null,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => pageModel.total;

  @override
  int get selectedRowCount => (pageModel.records.where((v) => v['selected'] ?? false).length);
}
