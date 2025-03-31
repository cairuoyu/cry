/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2025/3/31
/// @version: 1.0
/// @description:

import 'dart:convert';

import 'package:cry/model.dart';

class CryProperties {
  ApiProperties apiProperties;
  LoggerProperties loggerProperties;

  CryProperties({required this.apiProperties, required this.loggerProperties});

  CryProperties copyWith({
    ApiProperties? apiProperties,
    LoggerProperties? loggerProperties,
  }) {
    return CryProperties(
      apiProperties: apiProperties ?? this.apiProperties,
      loggerProperties: loggerProperties ?? this.loggerProperties,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiProperties': apiProperties.toMap(),
      'loggerProperties': loggerProperties.toMap(),
    };
  }

  factory CryProperties.fromMap(Map<String, dynamic> map) {
    return CryProperties(
      apiProperties: ApiProperties.fromMap(
        map['apiProperties'] as Map<String, dynamic>,
      ),
      loggerProperties: LoggerProperties.fromMap(
        map['loggerProperties'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryProperties.fromJson(String source) =>
      CryProperties.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CryProperties(apiProperties: $apiProperties, loggerProperties: $loggerProperties)';

  @override
  bool operator ==(covariant CryProperties other) {
    if (identical(this, other)) return true;

    return other.apiProperties == apiProperties &&
        other.loggerProperties == loggerProperties;
  }

  @override
  int get hashCode => apiProperties.hashCode ^ loggerProperties.hashCode;
}
