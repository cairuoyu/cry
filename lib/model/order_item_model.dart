import 'dart:convert';

class OrderItemModel {
  String column;
  bool asc;
  OrderItemModel({
    this.column,
    this.asc,
  });

  OrderItemModel copyWith({
    String column,
    bool asc,
  }) {
    return OrderItemModel(
      column: column ?? this.column,
      asc: asc ?? this.asc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'column': column,
      'asc': asc,
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OrderItemModel(
      column: map['column'],
      asc: map['asc'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromJson(String source) => OrderItemModel.fromMap(json.decode(source));

  @override
  String toString() => 'OrderItemModel(column: $column, asc: $asc)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OrderItemModel && o.column == column && o.asc == asc;
  }

  @override
  int get hashCode => column.hashCode ^ asc.hashCode;
}
