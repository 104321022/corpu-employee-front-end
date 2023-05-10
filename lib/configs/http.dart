import 'package:dio/dio.dart';

class HTTPConfig {
  static const String baseURL = 'http://144.138.60.69:8000/';

  HTTPConfig(
    BaseOptions options,
  ) {
    options.baseUrl = baseURL;
  }
}
