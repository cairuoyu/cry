import 'package:cry/constants/cry_constant.dart';

import 'utils/cry_utils.dart';

/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/10/25
/// @version: 1.0
/// @description:
class CryLogger {
  static error(message) {
    if ([CryConstant.LOGGEER_LEVEL_ERROR, CryConstant.LOGGEER_LEVEL_INFO, CryConstant.LOGGEER_LEVEL_DEBUG].contains(CryUtils.getCryProperties().loggerProperties.level)) {
      print(message);
    }
  }

  static info(message) {
    if ([CryConstant.LOGGEER_LEVEL_INFO, CryConstant.LOGGEER_LEVEL_DEBUG].contains(CryUtils.getCryProperties().loggerProperties.level)) {
      print(message);
    }
  }

  static debug(message) {
    if ([CryConstant.LOGGEER_LEVEL_DEBUG].contains(CryUtils.getCryProperties().loggerProperties.level)) {
      print(message);
    }
  }
}
