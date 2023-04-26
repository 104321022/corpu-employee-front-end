import 'package:dio/dio.dart';

class HTTPConfig {
  static const String baseURL = '';

  HTTPConfig(
    BaseOptions options,
  ) {
    options.baseUrl = baseURL;
  }
}
