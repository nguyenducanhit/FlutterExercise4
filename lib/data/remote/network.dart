import 'package:api_practice/data/remote/api_const.dart';
import 'package:dio/dio.dart';

class Network {
  int _timeout = 10000;
  Dio _dio;

  Network() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConst.BASE_URL,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      queryParameters: {"apiKey": ApiConst.API_KEY},
    );

    _dio = Dio(baseOptions);
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> get({String url, Map<String, dynamic> params}) {
    return _dio.get(url, queryParameters: params);
  }
}
