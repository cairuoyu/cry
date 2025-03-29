import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'order_item_model.dart';

class PageModel {
  int total;
  int size;
  int current;
  int pages;
  List<OrderItemModel> orders;
  List<Map<String, dynamic>> records;

  PageModel({
    this.total = 0,
    this.size = 10,
    this.current = 1,
    this.pages = 1,
    this.orders = const [],
    this.records = const [],
  });

  PageModel copyWith({
    int? total,
    int? size,
    int? current,
    int? pages,
    List<OrderItemModel>? orders,
    List<Map<String, dynamic>>? records,
  }) {
    return PageModel(
      total: total ?? this.total,
      size: size ?? this.size,
      current: current ?? this.current,
      pages: pages ?? this.pages,
      orders: orders ?? this.orders,
      records: records ?? this.records,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'size': size,
      'current': current,
      'pages': pages,
      'orders': orders.map((x) => x.toMap()).toList(),
      'records': records,
    };
  }

  factory PageModel.fromMap(Map<String, dynamic> map) {
    return PageModel(
      total: map['total'],
      size: map['size'],
      current: map['current'],
      pages: map['pages'],
      orders: map['orders'] == null ? [] : List<OrderItemModel>.from(map['orders'].map((x) => OrderItemModel.fromMap(x))),
      records: List.from(map['records'].map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PageModel.fromJson(String source) => PageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PageModel(total: $total, size: $size, current: $current, pages: $pages, orders: $orders, records: $records)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PageModel && o.total == total && o.size == size && o.current == current && o.pages == pages && listEquals(o.orders, orders) && listEquals(o.records, records);
  }

  @override
  int get hashCode {
    return total.hashCode ^ size.hashCode ^ current.hashCode ^ pages.hashCode ^ orders.hashCode ^ records.hashCode;
  }
}
