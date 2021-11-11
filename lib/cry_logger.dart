/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/10/25
/// @version: 1.0
/// @description:

import 'package:cry/common/application_context.dart';
import 'package:cry/constants/cry_constant.dart';

class CryLogger {
  static error(_) {
    if ([
      CryConstant.LOGGEER_LEVEL_ERROR,
      CryConstant.LOGGEER_LEVEL_INFO,
      CryConstant.LOGGEER_LEVEL_DEBUG
    ].contains(ApplicationContext.instance.loggerProperties.level)) {
      print(_);
    }
  }

  static info(_) {
    if ([CryConstant.LOGGEER_LEVEL_INFO, CryConstant.LOGGEER_LEVEL_DEBUG]
        .contains(ApplicationContext.instance.loggerProperties.level)) {
      print(_);
    }
  }

  static debug(_) {
    if ([CryConstant.LOGGEER_LEVEL_DEBUG]
        .contains(ApplicationContext.instance.loggerProperties.level)) {
      print(_);
    }
  }
}
