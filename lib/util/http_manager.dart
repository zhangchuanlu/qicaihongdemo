import 'package:dio/dio.dart';
import 'dart:io';

class HttpManager extends Dio {

  static const String CONTENT_TYPE_JSON = "application";
  static const String CONTENT_TYPE_FORM = "x-www-form-urlencoded";
  static const String CONTENT_CHART_SET = 'utf-8';

  // 工厂模式
  factory HttpManager() =>_getInstance();
  static HttpManager get instance => _getInstance();
  static HttpManager _instance;
  HttpManager._internal() {
    // 初始化
  }

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance =  HttpManager._internal();

      BaseOptions options = BaseOptions(
        // 15s 超时时间
          connectTimeout:15000,
          receiveTimeout:30000,
          responseType: ResponseType.json,
          contentType: ContentType(CONTENT_TYPE_JSON, CONTENT_TYPE_FORM,charset: CONTENT_CHART_SET)
      );
      _instance.options = options;

      
    }
    return _instance;
  }


  
}