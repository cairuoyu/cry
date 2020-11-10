import 'package:flutter/material.dart';

class TreeModel<T extends TreeData> {
  TreeModel({this.data});

  T data;
  TreeModel<T> parent;
  List<TreeModel<T>> children = [];
  bool isExpanded = false;
  IconData icon = Icons.menu;
  bool checked = false;
}

class TreeData {
  TreeData(this.id, this.pid);
  bool checked;
  String id;
  String pid;
}
