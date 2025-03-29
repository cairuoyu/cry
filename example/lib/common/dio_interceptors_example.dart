/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry
/// @date: 2023/4/2
/// @version: 1.0
/// @description:

import 'package:cry/utils.dart';
import 'package:dio/dio.dart';

class DioInterceptorsExample extends InterceptorsWrapper {
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LoggerUtil.info('REQUEST[${options.method}] => PATH: ${options.path}');
    // options.headers[HttpHeaders.authorizationHeader] = "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxIiwic3ViIjoiNzNkYzZjOGEzY2ZlMTUwNGQwNGNkMzRlYzA3NTBhODIiLCJpc3MiOiJ1c2VyIiwiaWF0IjoxNjgwMzI3OTY5fQ.Z71-NBkpI6A8cWfAYtyeBJuxP54tqhKO5j-UkP3oHD0";
    CryUtil.loading();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    CryUtil.loaded();
    LoggerUtil.info('RESPONSE.statusCode[${response.statusCode}] => response.realUri: ${response.realUri}');
    LoggerUtil.info('RESPONSE.data[${response.data}]');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    CryUtil.loaded();
    LoggerUtil.error('ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri}');
    LoggerUtil.error(err.toString());
    String message = '请求出错：' + err.toString();
    CryUtil.message(message);
    super.onError(err, handler);
  }
}
