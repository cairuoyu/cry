/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'vo/tree_vo.dart';

class CryTreeTable<T extends TreeData> extends StatefulWidget {
  final List<CryTreeTableColumnData>? columnData;
  final List<TreeVO<T>>? data;
  final Widget? toolbars;
  final Function(TreeVO<T>, TreeVO<T>?)? getRowOper;
  final Function(TreeVO<T>?)? onSelected;
  final double tableWidth;
  final CryTreeTableSelectType selectType;

  CryTreeTable({
    Key? key,
    this.columnData,
    this.data,
    this.toolbars,
    this.getRowOper,
    this.onSelected,
    this.tableWidth = 1000,
    this.selectType = CryTreeTableSelectType.childrenCascade,
  }) : super(key: key);

  @override
  CryTreeTableState createState() => CryTreeTableState<T>();
}

class CryTreeTableState<T extends TreeData> extends State<CryTreeTable<T>> {
  bool? checkAll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Column c = Column(
      children: [
        _getToolbars(),
        _getTableHeader(),
        _getTableBody(),
      ],
    );
    var result = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: widget.tableWidth,
        child: c,
      ),
    );

    return result;
  }

  _getToolbars() {
    var result = Container(
      decoration: _getBoxDecoration(),
      child: widget.toolbars,
    );
    return result;
  }

  Widget _getTableHeader() {
    var leading = widget.onSelected == null
        ? null
        : Checkbox(
            value: this.checkAll,
            onChanged: (v) {
              this._checkAll(v);
              widget.onSelected!(null);
            });
    List<Widget> list = [];
    widget.columnData!.forEach((element) {
      list.add(_wrapCell(Text(element.label ?? '--'), width: element.width));
    });
    if (widget.getRowOper != null) {
      list.insert(0, _wrapCell(Text(S.of(context).operating), width: 100));
    }
    var result = Container(
      decoration: _getBoxDecoration(header: true),
      child: ListTile(
        leading: leading,
        title: Row(
          children: list,
        ),
      ),
    );
    return result;
  }

  Widget _getTableBody() {
    var rowList = _getRowList(widget.data ?? [], null);
    return Column(
      children: rowList,
    );
  }

  List<Widget> _getRowList(List<TreeVO<T>> data, TreeVO<T>? parent) {
    List<Widget> list = [];
    for (var i = 0; i < data.length; i++) {
      TreeVO<T> vo = data[i];
      List<Widget> columnList = [];
      columnList = widget.columnData!
          .map<Widget>(
            (v) => _wrapCell(v.getCell!(vo.data), width: v.width),
          )
          .toList();

      if (widget.getRowOper != null) {
        var s = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 100,
            child: Row(
              children: widget.getRowOper!(vo, parent),
            ),
          ),
        );
        columnList.insert(0, s);
      }

      var title = Row(children: columnList);
      var leading = widget.onSelected == null
          ? null
          : Checkbox(
              value: vo.checked,
              onChanged: (v) {
                vo.checked = v;
                switch (widget.selectType) {
                  case CryTreeTableSelectType.childrenCascade:
                    {
                      _checkChildren(vo, v);
                      break;
                    }
                  case CryTreeTableSelectType.parentCascadeTrue:
                    {
                      _checkParent(vo, v!);
                      break;
                    }
                }
                if (widget.onSelected != null) {
                  widget.onSelected!(vo);
                }
              },
            );
      Widget d;
      if (vo.children.length > 0) {
        d = Container(
          decoration: _getBoxDecoration(),
          child: ExpansionTile(
            leading: leading,
            initiallyExpanded: true,
            children: _getRowList(vo.children, vo),
            title: title,
          ),
        );
      } else {
        d = Container(
          decoration: _getBoxDecoration(),
          child: ListTile(
            leading: leading,
            title: title,
          ),
        );
      }
      list.add(d);
    }
    return list;
  }

  _getBoxDecoration({header = false, odd = true}) {
    var bd = BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(2.0, 2.0), blurRadius: 4.0),
      ],
      color: header
          ? Colors.white60
          : odd
              ? Colors.white
              : Colors.white38,
      border: Border(bottom: BorderSide(color: Colors.black12)),
    );
    return bd;
  }

  _wrapCell(Widget? cell, {double width = 200}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: cell,
      width: width,
    );
  }

  _checkAll(bool? v) {
    widget.data!.forEach((element) {
      this._checkChildren(element, v);
    });
    this.checkAll = v;
  }

  _checkParent(TreeVO? vo, bool v) {
    if (v && vo!.parent != null) {
      vo.parent!.checked = v;
      if (vo.parent!.parent != null) {
        this._checkParent(vo.parent, v);
      }
    }
  }

  _checkChildren(TreeVO vo, bool? v) {
    vo.checked = v;
    vo.children.forEach((c) {
      c.checked = v;
      _checkChildren(c, v);
    });
  }

  List<T?> getSelectedData() {
    List<T> result = [];
    return this._getSelectedData(result, widget.data!);
  }

  List<T?> _getSelectedData(List<T?> result, List<TreeVO<T>> data) {
    data.forEach((element) {
      if (element.checked!) {
        result.add(element.data);
      }
      if (element.children.length > 0) {
        this._getSelectedData(result, element.children);
      }
    });
    return result;
  }
}

enum CryTreeTableSelectType {
  parentCascadeTrue,
  childrenCascade,
}

class CryTreeTableColumnData {
  CryTreeTableColumnData({this.label, this.getCell, this.width = 200});

  Function? getCell;
  String? label;
  double width;
}
