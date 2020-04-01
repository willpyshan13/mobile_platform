import 'package:flutter_admin/base/httpUtil.dart';

class AppApi {
  static page(Map<String,dynamic> params) {
    return HttpUtil.get('/app/list', params);
  }
  static getById(data) {
    return HttpUtil.post('/app/getById', data: data);
  }
  static save(data) {
    return HttpUtil.post('/app/upload', data: data);
  }
  static update(data) {
    return HttpUtil.post('/app/update', data: data);
  }
  static removeByIds(data){
    return HttpUtil.post('/app/removeByIds', data: data);
  }
}
