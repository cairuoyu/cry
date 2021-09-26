/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/model/application.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter/services.dart';

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
  late Application application;
  late String privacy;

  init() async {
    await this.loadApplication();
    this.loadPrivacy();
  }

  loadApplication() async {
    GlobalConfiguration globalConfiguration = await GlobalConfiguration().loadFromPath('config/application.json');
    print("application:");
    print(globalConfiguration.appConfig);
    this.application = Application.fromMap(globalConfiguration.appConfig);
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
