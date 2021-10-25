/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'dart:convert';

import 'package:cry/constants/cry_enums.dart';
import 'package:cry/cry_logger.dart';
import 'package:cry/model/api_roperties.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

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
  late LoggerType logger;
  late String privacy;

  init() async {
    await this.loadApplication();
    this.loadPrivacy();
  }

  loadApplication() async {
    var yamlStr = await rootBundle.loadString('config/application.yaml');
    YamlMap yamlMap = loadYaml(yamlStr);
    print("api:");
    print(yamlMap.nodes);
    YamlMap cry = yamlMap.nodes['cry']!.value;

    String loggerStr = cry['logger'] ?? 'info';
    this.logger = loggerStr == 'error'
        ? LoggerType.error
        : loggerStr == 'debug'
            ? LoggerType.debug
            : LoggerType.info;
    print(this.logger);

    var apiStr = cry['api'];
    var api = json.decode(json.encode(apiStr));
    this.apiProperties = ApiProperties.fromMap(api);
    CryLogger.info(this.apiProperties);
  }

  loadPrivacy() async {
    this.privacy = await rootBundle.loadString('PRIVACY');
    CryLogger.info(this.privacy);
  }

  addBean(String key, object) {
    beanMap[key] = object;
  }

  getBean(String key) {
    return beanMap[key];
  }
}
