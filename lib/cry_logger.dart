import 'package:cry/constants/cry_constant.dart';

import 'utils/cry_utils.dart';

/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/10/25
/// @version: 1.0
/// @description:
class CryLogger {
  static error(_) {
    if ([CryConstant.LOGGEER_LEVEL_ERROR, CryConstant.LOGGEER_LEVEL_INFO, CryConstant.LOGGEER_LEVEL_DEBUG].contains(CryUtils.getCryProperties().loggerProperties.level)) {
      print(_);
    }
  }

  static info(_) {
    if ([CryConstant.LOGGEER_LEVEL_INFO, CryConstant.LOGGEER_LEVEL_DEBUG].contains(CryUtils.getCryProperties().loggerProperties.level)) {
      print(_);
    }
  }

  static debug(_) {
    if ([CryConstant.LOGGEER_LEVEL_DEBUG].contains(CryUtils.getCryProperties().loggerProperties.level)) {
      print(_);
    }
  }
}
