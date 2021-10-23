/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'dart:convert';

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
  late String privacy;

  init() async {
    await this.loadApplication();
    this.loadPrivacy();
  }

  loadApplication() async {
    var yamlstr = await rootBundle.loadString('config/application.yaml');
    YamlMap yamlMap = loadYaml(yamlstr);

    print("api:");
    print(yamlMap.nodes);
    var apiYaml = yamlMap.nodes['cry']?.value['api'];
    var api = json.decode(json.encode(apiYaml));
    this.apiProperties = ApiProperties.fromMap(api);
    print(this.apiProperties);
  }

  loadPrivacy() async {
    print('load privacy:');
    this.privacy = await rootBundle.loadString('PRIVACY');
    print(this.privacy);
  }

  addBean(String key, object) {
    beanMap[key] = object;
  }

  getBean(String key) {
    return beanMap[key];
  }
}
