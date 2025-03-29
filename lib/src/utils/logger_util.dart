/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/10/25
/// @version: 1.0
/// @description:

import 'package:cry/constants.dart';
import 'package:cry/utils.dart';

class LoggerUtil {
  static error(message) {
    if ([
      CryConstant.LOGGEER_LEVEL_ERROR,
      CryConstant.LOGGEER_LEVEL_INFO,
      CryConstant.LOGGEER_LEVEL_DEBUG,
    ].contains(CryUtil.getCryProperties().loggerProperties.level)) {
      print(message);
    }
  }

  static info(message) {
    if ([
      CryConstant.LOGGEER_LEVEL_INFO,
      CryConstant.LOGGEER_LEVEL_DEBUG,
    ].contains(CryUtil.getCryProperties().loggerProperties.level)) {
      print(message);
    }
  }

  static debug(message) {
    if ([
      CryConstant.LOGGEER_LEVEL_DEBUG,
    ].contains(CryUtil.getCryProperties().loggerProperties.level)) {
      print(message);
    }
  }
}
