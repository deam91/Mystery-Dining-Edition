import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor();

  final yelpKey = dotenv.env['YELP_KEY'];

  Future<String> _getAuthToken() async {
    if (yelpKey != null) {
      return 'Bearer $yelpKey';
    }
    return '';
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = await _getAuthToken();
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    return super.onError(error, handler);
  }
}
