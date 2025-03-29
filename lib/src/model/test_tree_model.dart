import 'dart:convert';

import 'package:cry/vo.dart';


class TestTreeModel extends TreeData {
  String? id;
  String? pid;
  bool? checked;
  String? c1;
  String? c2;

  TestTreeModel({
    this.id,
    this.pid,
    this.checked,
    this.c1,
    this.c2,
  }) : super(id, pid);

  TestTreeModel copyWith({
    String? id,
    String? pid,
    bool? checked,
    String? c1,
    String? c2,
  }) {
    return TestTreeModel(
      id: id ?? this.id,
      pid: pid ?? this.pid,
      checked: checked ?? this.checked,
      c1: c1 ?? this.c1,
      c2: c2 ?? this.c2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pid': pid,
      'checked': checked,
      'c1': c1,
      'c2': c2,
    };
  }

  factory TestTreeModel.fromMap(Map<String, dynamic> map) {

    return TestTreeModel(
      id: map['id'],
      pid: map['pid'],
      checked: map['checked'],
      c1: map['c1'],
      c2: map['c2'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TestTreeModel.fromJson(String source) => TestTreeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TestTreeModel(id: $id, pid: $pid, checked: $checked, c1: $c1, c2: $c2)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is TestTreeModel &&
      o.id == id &&
      o.pid == pid &&
      o.checked == checked &&
      o.c1 == c1 &&
      o.c2 == c2;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      pid.hashCode ^
      checked.hashCode ^
      c1.hashCode ^
      c2.hashCode;
  }
}
