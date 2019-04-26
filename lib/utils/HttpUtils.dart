import 'package:dio/dio.dart';

class HttpUtils {
  static HttpUtils get instance => _getInstance();
  static HttpUtils _instance;

  static Dio _dio;

  HttpUtils._internal() {
    // 初始化
    _dio = new Dio();
  }

  factory HttpUtils() {
    return _getInstance();
  }

  static HttpUtils _getInstance() {
    if (_instance == null) {
      _instance = new HttpUtils._internal();
    }
    return _instance;
  }

  Dio getDio() {
// 配置dio实例
    _dio.options.baseUrl = "https://wanandroid.com";
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;

    return _dio;
  }
}
