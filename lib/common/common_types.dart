import 'package:flutter/material.dart';

typedef IntWidgetFunction = Widget Function(int index);
typedef MapDataCellListFunction = List<DataCell> Function(Map<String, dynamic>);
typedef MapVoidFunction = void Function(Map<String, dynamic>);
typedef MapBoolFunction = bool Function(Map<String, dynamic>);
