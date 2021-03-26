import 'dart:convert';

class ResponseBodyApi<T> {
  bool? success;
  String? code;
  String? message;
  T? data;
  ResponseBodyApi({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  ResponseBodyApi<T> copyWith({
    bool? success,
    String? code,
    String? message,
    T? data,
  }) {
    return ResponseBodyApi<T>(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'code': code,
      'message': message,
      'data': data,
    };
  }

  factory ResponseBodyApi.fromMap(Map<String, dynamic> map) {

    return ResponseBodyApi<T>(
      success: map['success'],
      code: map['code'],
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseBodyApi.fromJson(String source) => ResponseBodyApi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseBodyApi(success: $success, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ResponseBodyApi<T> &&
      o.success == success &&
      o.code == code &&
      o.message == message &&
      o.data == data;
  }

  @override
  int get hashCode {
    return success.hashCode ^
      code.hashCode ^
      message.hashCode ^
      data.hashCode;
  }
}
