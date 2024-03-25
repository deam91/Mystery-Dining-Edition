import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mystery_dining_edition/common/http/api_result.dart';
import 'package:mystery_dining_edition/common/http/authorization_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum _ApiRequestType { post, get, put }

class ApiProvider {
  ApiProvider({Dio? dio, Map<String, String>? dotEnv}) {
    final env = dotEnv ?? dotenv.env;
    if (env['BASE_URL'] != null) {
      _baseUrl = env['BASE_URL']!;
    }

    // Set dio base url so no need to set the full url for each request
    _dio = dio ?? Dio(BaseOptions(baseUrl: _baseUrl));
    _dio.options.sendTimeout = const Duration(milliseconds: 20000);
    _dio.options.connectTimeout = const Duration(milliseconds: 20000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 20000);
    _dio.interceptors.add(
      AuthorizationInterceptor(),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }

    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        logPrint: print,
        retryableExtraStatuses: {401, 403},
        retries: 2,
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
    );

    if (kReleaseMode) {
      _dio.httpClientAdapter = IOHttpClientAdapter();
      (_dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
          (X509Certificate? cert, String host, int port) => true;
    }
  }

  late Dio _dio;

  late String _baseUrl;

  Future<APIResult<T>> requestGet<T>(
    String path, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    ContentType contentType = ContentType.json,
    T Function(dynamic json)? fromJson,
  }) async {
    return _apiCall(
      path,
      _ApiRequestType.get,
      newBaseUrl: newBaseUrl,
      token: token,
      query: query,
      contentType: contentType,
      fromJson: fromJson,
    );
  }

  Future<APIResult<T>> requestPost<T>(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    ContentType contentType = ContentType.json,
    T Function(dynamic json)? fromJson,
    ProgressCallback? onSendProgress,
  }) async {
    return _apiCall(
      path,
      body: body,
      _ApiRequestType.post,
      newBaseUrl: newBaseUrl,
      token: token,
      query: query,
      contentType: contentType,
      fromJson: fromJson,
      onSendProgress: onSendProgress,
    );
  }

  Future<APIResult<T>> requestPut<T>(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    ContentType contentType = ContentType.json,
    T Function(dynamic json)? fromJson,
    ProgressCallback? onSendProgress,
  }) async {
    return _apiCall(
      path,
      body: body,
      _ApiRequestType.put,
      newBaseUrl: newBaseUrl,
      token: token,
      query: query,
      contentType: contentType,
      fromJson: fromJson,
      onSendProgress: onSendProgress,
    );
  }

  Future<APIResult<T>> _apiCall<T>(
    String path,
    _ApiRequestType requestType, {
    dynamic body,
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    ContentType contentType = ContentType.json,
    T Function(dynamic json)? fromJson,
    ProgressCallback? onSendProgress,
  }) async {
    /// Connectivity check is done by dio_connectivity_request_retrier.dart interceptor
    /// Different base url is not used right now.
    /// No need to set the full url neither.
    final url = path;
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    } else if (contentType == ContentType.formData) {
      content = 'multipart/form-data';
    }

    try {
      /// App Id token is managed using an interceptor
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };

      /// Authorization check and token refresh is managed by an interceptor
      late final Response<dynamic> response;
      if (requestType == _ApiRequestType.post) {
        response = await _dio.post(
          url,
          data: body,
          queryParameters: query,
          options: Options(
            validateStatus: (status) => true,
            headers: headers,
          ),
          onSendProgress: onSendProgress,
        );
      } else if (requestType == _ApiRequestType.put) {
        response = await _dio.put(
          url,
          data: body,
          queryParameters: query,
          options: Options(
            validateStatus: (status) => true,
            headers: headers,
          ),
          onSendProgress: onSendProgress,
        );
      } else {
        response = await _dio.get(
          url,
          queryParameters: query,
          options: Options(validateStatus: (status) => true, headers: headers),
        );
      }

      if (response.statusCode == null) {
        return APIResult.error(
          APIErrorType.connectivity,
          message: 'Unstable connection',
        );
      }

      if (response.statusCode! < 300) {
        dynamic data;
        if (response.data != null &&
            response.data is Map &&
            (response.data as Map).containsKey('data')) {
          data = (response.data as Map)['data'];
          final resp = fromJson != null
              ? fromJson((response.data as Map)['data'])
              : (response.data as Map)['data'];
          return APIResult.success(resp as T);
        } else {
          data = response.data;
        }
        try {
          final res = fromJson != null ? fromJson(data) : data;
          return APIResult.success(res as T);
        } on Exception catch (e) {
          debugPrint(e.toString());
          return APIResult.error(
            APIErrorType.parseResponse,
            message: e.toString(),
          );
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return APIResult.error(APIErrorType.unauthorized);
        } else if (response.statusCode! == 502) {
          return APIResult.error(APIErrorType.serverError);
        } else {
          if ((response.data as Map)['detail'] != null) {
            return APIResult.error(
              APIErrorType.apiError,
              message: (response.data as Map)['detail'] as String?,
            );
          } else {
            return APIResult.error(
              APIErrorType.serverError,
              message: (response.data as Map)['detail'] as String?,
            );
          }
        }
      }
    } on DioException catch (e) {
      if (e.error is SocketException ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return APIResult.error(APIErrorType.connectivity);
      }

      if (e.response != null) {
        if (e.response!.data['detail'] != null) {
          return APIResult.error(
            APIErrorType.apiError,
            message: (e.response?.data as Map)['detail'] as String?,
          );
        }
      }
      return APIResult.error(APIErrorType.apiError, message: e.message);
    } on Exception catch (e) {
      return APIResult.error(
        APIErrorType.apiError,
        message: e.toString(),
      );
    }
  }
}

enum ContentType { urlEncoded, json, formData }
