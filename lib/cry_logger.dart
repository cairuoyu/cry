/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/10/25
/// @version: 1.0
/// @description:

import 'package:cry/common/application_context.dart';
import 'constants/cry_enums.dart';

class CryLogger {
  static error(_) {
    if ([LoggerType.error, LoggerType.info, LoggerType.debug].contains(ApplicationContext.instance.logger)) {
      print(_);
    }
  }

  static info(_) {
    if ([LoggerType.info, LoggerType.debug].contains(ApplicationContext.instance.logger)) {
      print(_);
    }
  }

  static debug(_) {
    if ([LoggerType.debug].contains(ApplicationContext.instance.logger)) {
      print(_);
    }
  }
}
