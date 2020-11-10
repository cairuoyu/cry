import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'order_item_model.dart';


class PageModel {
  num total = 0;
  num size = 10;
  num current = 1;
  num pages = 1;
  List<OrderItemModel> orders;
  List<Map> records;
  PageModel({
    this.total,
    this.size,
    this.current,
    this.pages,
    this.orders,
    this.records,
  });

  PageModel copyWith({
    num total,
    num size,
    num current,
    num pages,
    List<OrderItemModel> orders,
    List<Map> records,
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
      'orders': orders?.map((x) => x?.toMap())?.toList(),
      'records': records,
    };
  }

  factory PageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PageModel(
      total: map['total'],
      size: map['size'],
      current: map['current'],
      pages: map['pages'],
      orders: List<OrderItemModel>.from(map['orders']?.map((x) => OrderItemModel.fromMap(x))),
      records: List<Map>.from(map['records']?.map((x) => x)),
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

    return o is PageModel &&
        o.total == total &&
        o.size == size &&
        o.current == current &&
        o.pages == pages &&
        listEquals(o.orders, orders) &&
        listEquals(o.records, records);
  }

  @override
  int get hashCode {
    return total.hashCode ^ size.hashCode ^ current.hashCode ^ pages.hashCode ^ orders.hashCode ^ records.hashCode;
  }
}
