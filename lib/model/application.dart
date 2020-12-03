import 'dart:convert';

class Application {
  String baseUrl;
  int connectTimeout;
  int receiveTimeout;

  Application({
    this.baseUrl = "http://cairuoyu.com/api/",
    this.connectTimeout,
    this.receiveTimeout,
  });

  Application copyWith({
    String baseUrl,
    int connectTimeout,
    int receiveTimeout,
  }) {
    return Application(
      baseUrl: baseUrl ?? this.baseUrl,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'baseUrl': baseUrl,
      'connectTimeout': connectTimeout,
      'receiveTimeout': receiveTimeout,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Application(
      baseUrl: map['baseUrl'],
      connectTimeout: map['connectTimeout'],
      receiveTimeout: map['receiveTimeout'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) => Application.fromMap(json.decode(source));

  @override
  String toString() => 'Application(baseUrl: $baseUrl, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Application && o.baseUrl == baseUrl && o.connectTimeout == connectTimeout && o.receiveTimeout == receiveTimeout;
  }

  @override
  int get hashCode => baseUrl.hashCode ^ connectTimeout.hashCode ^ receiveTimeout.hashCode;
}
