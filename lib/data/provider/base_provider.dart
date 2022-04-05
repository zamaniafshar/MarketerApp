import 'package:dio/dio.dart';

final Dio _dio = Dio(BaseOptions(
  connectTimeout: 30000,
  sendTimeout: 30000,
  receiveTimeout: 30000,
));

Future<Response> get(
  final String url, {
  final Options? options,
}) {
  return _dio.get(url, options: options);
}

Future<Response> post(final String url,
    {final dynamic data, final Options? options}) {
  return _dio.post(url, data: data, options: options);
}
