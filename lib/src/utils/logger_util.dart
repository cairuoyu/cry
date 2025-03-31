/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/10/25
/// @version: 1.0
/// @description:

import 'package:cry/constants.dart';
import 'package:cry/utils.dart';
import 'package:logger/logger.dart';

class LoggerUtil {
  static var logger = Logger(printer: PrettyPrinter());
  static var loggerSimple = Logger(printer: SimplePrinter());
  static var loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));

  static error(message, {Object? error}) {
    if ([
      CryConstant.LOGGEER_LEVEL_ERROR,
      CryConstant.LOGGEER_LEVEL_INFO,
      CryConstant.LOGGEER_LEVEL_DEBUG,
    ].contains(getLevel())) {
      logger.e(message, error: error);
    }
  }

  static info(message) {
    if ([
      CryConstant.LOGGEER_LEVEL_INFO,
      CryConstant.LOGGEER_LEVEL_DEBUG,
    ].contains(getLevel())) {
      loggerSimple.i(message);
    }
  }

  static debug(message) {
    if ([
      CryConstant.LOGGEER_LEVEL_DEBUG,
    ].contains(getLevel())) {
      loggerSimple.d(message);
    }
  }

  static getLevel() {
    return (CryUtil.getCryProperties()?.loggerProperties.level) ?? 'debug';
  }
}
