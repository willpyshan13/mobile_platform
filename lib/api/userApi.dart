import 'package:flutter_admin/models/responeBodyApi.dart';
import 'package:flutter_admin/utils/httpUtil.dart';

class UserApi {
  static Future<ResponseBodyApi> register(data) async {
    ResponseBodyApi responeBodyApi = await HttpUtil.post('/api/register', data: data, requestToken: false);
    return responeBodyApi;
  }

  static Future<ResponseBodyApi> login(data) async {
    // String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    ResponseBodyApi responseBodyApi = await HttpUtil.post('/api/login', data: data, requestToken: false);
    return responseBodyApi;
  }
}
