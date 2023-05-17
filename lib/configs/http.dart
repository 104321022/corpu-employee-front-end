import 'package:dio/dio.dart';

class HTTPConfig {
  static const String baseURL = 'https://corpuemployee.herokuapp.com/';

  HTTPConfig(
    BaseOptions options,
  ) {
    options.baseUrl = baseURL;
  }
}
