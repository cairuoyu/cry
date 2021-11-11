class LoggerProperties{
  String level = 'info';

//<editor-fold desc="Data Methods">

  LoggerProperties({
    required this.level,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoggerProperties &&
          runtimeType == other.runtimeType &&
          level == other.level);

  @override
  int get hashCode => level.hashCode;

  @override
  String toString() {
    return 'LoggerProperties{' + ' level: $level,' + '}';
  }

  LoggerProperties copyWith({
    String? level,
  }) {
    return LoggerProperties(
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'level': this.level,
    };
  }

  factory LoggerProperties.fromMap(Map map) {
    return LoggerProperties(
      level: map['level'] as String,
    );
  }

//</editor-fold>
}
