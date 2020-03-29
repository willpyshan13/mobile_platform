import 'package:flutter_admin/base/httpUtil.dart';

class PersonApi {
  static list(data) {
    return HttpUtil.post('/app/list', data: data);
  }
  static page(Map<String,dynamic> params) {
    return HttpUtil.get('/app/list', params);
  }
  static getById(data) {
    return HttpUtil.post('/app/getById', data: data);
  }
  static saveOrUpdate(data) {
    return HttpUtil.post('/app/saveOrUpdate', data: data);
  }
  static removeByIds(data){
    return HttpUtil.post('/app/removeByIds', data: data);
  }
}
