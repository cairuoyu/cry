import 'package:cry/model/application.dart';
import 'package:global_configuration/global_configuration.dart';


class ApplicationContext {
  ApplicationContext._();

  static ApplicationContext _instance;

  static ApplicationContext get instance => _getInstance();

  static ApplicationContext _getInstance() {
    if (_instance == null) {
      _instance = ApplicationContext._();
    }
    return _instance;
  }

  Map beanMap = Map();
  Application application;

  init() async {
    await this.loadApplication();
  }

  loadApplication() async {
    GlobalConfiguration globalConfiguration = await GlobalConfiguration().loadFromPath('config/application.json');
    print("application:");
    print(globalConfiguration.appConfig);
    this.application = Application.fromMap(globalConfiguration.appConfig);
  }

  addBean(String key, object) {
    beanMap[key] = object;
  }

  getBean(String key) {
    return beanMap[key];
  }
}
