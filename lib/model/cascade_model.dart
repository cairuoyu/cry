class CascadeModel {
  String code;
  String name;
  List<CascadeModel>? children;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  CascadeModel({
    required this.code,
    required this.name,
    this.children,
  });

  CascadeModel copyWith({
    required String code,
    required String name,
    List<CascadeModel>? children,
  }) {
    return new CascadeModel(
      code: code,
      name: name,
      children: children ?? this.children,
    );
  }

  @override
  String toString() {
    return 'CarcadeModel{code: $code, name: $name, children: $children}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CascadeModel && runtimeType == other.runtimeType && code == other.code && name == other.name && children == other.children);

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ children.hashCode;

  factory CascadeModel.fromMap(Map<String, dynamic> map) {
    return new CascadeModel(
      code: map['code'] as String,
      name: map['name'] as String,
      children: map['children']?.map<CascadeModel>((e) => CascadeModel.fromMap(e)).toList(),
      // children: map['children'] as List<CascadeModel>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'code': this.code,
      'name': this.name,
      'children': this.children,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
