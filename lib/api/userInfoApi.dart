import 'package:flutter_admin/models/responeBodyApi.dart';
import 'package:flutter_admin/base/httpUtil.dart';

class UserInfoApi {
  static Future<ResponseBodyApi> getCurrentUserInfo() {
    return HttpUtil.post('/userInfo/getCurrentUserInfo');
  }

  static saveOrUpdate(data) {
    return HttpUtil.post('/userInfo/saveOrUpdate', data: data);
  }
}
