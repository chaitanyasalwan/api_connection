import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
  }
  Dio get getdio {
    return _dio;
  }
}
