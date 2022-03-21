import 'package:camera/camera.dart';
import 'package:cry/cry_logger.dart';
import 'package:cry/model/api_properties.dart';
import 'package:cry/model/cry_properties.dart';
import 'package:cry/model/logger_properties.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:yaml/yaml.dart';

import 'face_service_import.dart';

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
  late YamlMap yamlMap;
  late Map variableMap;
  late String privacy;
  List<CameraDescription> cameras = [];

  FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
  ));

  init() async {
    await this.loadApplication();
    this.loadPrivacy();
    FaceService().loadModel();
    if (!kIsWeb) {
      cameras = await availableCameras();
    }
  }

  MapEntry convertVariable(key, value) {
    var match = RegExp(r'\$\{(.*)\}').firstMatch(value.toString());
    if (match != null) {
      var value2 = variableMap[match.group(1)];
      return MapEntry(key, value2);
    }
    return MapEntry(key, value);
  }

  parseCryProperties() async {
    YamlMap cry = yamlMap.nodes['cry']!.value;
    Map profiles = cry['profiles'].value;
    String? profilesActive = profiles['active'];
    if (profilesActive != null) {
      var profilesStr = await rootBundle.loadString('config/application-$profilesActive.yaml');
      variableMap = await loadYaml(profilesStr);
      print('profile-$profilesActive');
      print(variableMap);
    }

    CryProperties cryProperties = CryProperties();
    cryProperties.loggerProperties = LoggerProperties.fromMap(cry['logger'].value.map(convertVariable));
    cryProperties.apiProperties = ApiProperties.fromMap(cry['api'].value.map(convertVariable));
    addBean('cryProperties', cryProperties);
  }

  loadApplication() async {
    var yamlStr = await rootBundle.loadString('config/application.yaml');
    yamlMap = loadYaml(yamlStr);
    print("application:");
    print(yamlMap.nodes);
    await this.parseCryProperties();
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
