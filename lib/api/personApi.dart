import 'package:flutter_admin/utils/httpUtil.dart';

class PersonApi {
  static list(data) {
    return HttpUtil.post('/app/list', data: data);
  }
  static page(data) {
    return HttpUtil.post('/app/page', data: data);
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
