/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry
/// @date: 2023/4/2
/// @version: 1.0
/// @description:

import 'package:cry/cry_logger.dart';
import 'package:cry/utils/cry_utils.dart';
import 'package:dio/dio.dart';

class DioInterceptorsExample extends InterceptorsWrapper {
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    CryLogger.info('REQUEST[${options.method}] => PATH: ${options.path}');
    // options.headers[HttpHeaders.authorizationHeader] = "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxIiwic3ViIjoiNzNkYzZjOGEzY2ZlMTUwNGQwNGNkMzRlYzA3NTBhODIiLCJpc3MiOiJ1c2VyIiwiaWF0IjoxNjgwMzI3OTY5fQ.Z71-NBkpI6A8cWfAYtyeBJuxP54tqhKO5j-UkP3oHD0";
    CryUtils.loading();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    CryUtils.loaded();
    CryLogger.info('RESPONSE.statusCode[${response.statusCode}] => response.realUri: ${response.realUri}');
    CryLogger.info('RESPONSE.data[${response.data}]');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    CryUtils.loaded();
    CryLogger.error('ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri}');
    CryLogger.error(err.toString());
    String message = '请求出错：' + err.toString();
    CryUtils.message(message);
    super.onError(err, handler);
  }
}
