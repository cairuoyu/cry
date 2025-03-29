
import 'package:cry/model.dart';
import 'package:cry/utils.dart';

class FileApi {
  static Future<ResponseBodyApi> upload(data) async {
    return await HttpUtil.post('/file/upload', data: data);
  }
}
