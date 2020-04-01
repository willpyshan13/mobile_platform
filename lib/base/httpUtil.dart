import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_admin/models/responeBodyApi.dart';

import '../utils/globalUtil.dart';

class HttpUtil {
  static Dio dio;
  static const String API_PREFIX = 'http://localhost:8081/renren-api/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  static const String POST = 'post';
  static const String GET = 'get';
  static Future<ResponseBodyApi> post(String url, {data, requestToken = true}) async {
    Map map = await request(url, data: data, requestToken: requestToken);
    if (map == null) {}
    ResponseBodyApi responseBodyApi = ResponseBodyApi.fromJson(map);
    return responseBodyApi;
  }

  static Future<ResponseBodyApi> get(String url,Map<String,dynamic> data) async {
    Map map = await request(url,method: GET,parameters: data);
    if (map == null) {}
    ResponseBodyApi responseBodyApi = ResponseBodyApi.fromJson(map);
    return responseBodyApi;
  }

  static Future<Map> request(String url, {data, method, requestToken = true,parameters}) async {
    data = data ?? {};
    method = method ?? POST;

    if (url != "/user/login" && requestToken && GlobalUtil.token == null) {
      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Layout1()));
    }

    Dio dio = createInstance();
    if (requestToken) {
      dio.options.headers[HttpHeaders.authorizationHeader] = GlobalUtil.token;
    }
    dio.options.method = method;
    var result;

    try {
      Response res = await dio.request(url, data: data,queryParameters:parameters );
      result = res.data;
    } on DioError catch (e) {
      BotToast.showText(text: '请求出错：' + e.toString());

      throw e.toString() + '||' + API_PREFIX + url;
    }

    return result;
  }

  static Dio createInstance() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: API_PREFIX,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );

      dio = new Dio(options);
    }

    return dio;
  }

  static clear() {
    dio = null;
  }
}
