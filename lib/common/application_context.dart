import 'package:cry/cry_logger.dart';
import 'package:cry/model/api_properties.dart';
import 'package:cry/model/logger_properties.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:
class ApplicationContext {
  ApplicationContext._();

  static ApplicationContext? _instance;

  static ApplicationContext get instance => _getInstance();

  static ApplicationContext _getInstance() {
    if (_instance == null) {
      _instance = ApplicationContext._();
    }
    return _instance!;
  }

  Map beanMap = Map();
  late ApiProperties apiProperties;
  late LoggerProperties loggerProperties;
  late String privacy;

  init() async {
    await this.loadApplication();
    this.loadPrivacy();
  }

  loadApplication() async {
    var yamlStr = await rootBundle.loadString('config/application.yaml');
    YamlMap yamlMap = loadYaml(yamlStr);
    print("application:");
    print(yamlMap.nodes);
    YamlMap cry = yamlMap.nodes['cry']!.value;
    this.loggerProperties = LoggerProperties.fromMap(cry['logger'].value);
    this.apiProperties = ApiProperties.fromMap(cry['api'].value);
  }

  loadPrivacy() async {
    this.privacy = await rootBundle.loadString('PRIVACY');
    CryLogger.debug(this.privacy);
  }

  addBean(String key, object) {
    beanMap[key] = object;
  }

  getBean(String key) {
    return beanMap[key];
  }
}
