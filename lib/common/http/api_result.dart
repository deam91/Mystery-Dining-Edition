import 'package:flutter/cupertino.dart';
import 'package:mystery_dining_edition/l10n/l10n.dart';

enum APIErrorType {
  connectivity,
  unauthorized,
  serverError,
  apiError,
  parseResponse
}

class APIErrorData {
  APIErrorData({required this.type, this.message});
  final APIErrorType type;
  final String? message;
  String toErrorString(BuildContext context) {
    switch (type) {
      case APIErrorType.connectivity:
        return context.l10n.error_connection;
      case APIErrorType.serverError:
        return context.l10n.error_server;
      case APIErrorType.unauthorized:
        return context.l10n.error_unauthorized;
      case APIErrorType.apiError:
        return context.l10n.error_unknow;
      case APIErrorType.parseResponse:
        return context.l10n.error_unknow;
    }
  }
}

class APIResult<T> {
  APIResult({this.data, this.error});

  factory APIResult.success(T data) {
    return APIResult(
      data: data,
    );
  }

  factory APIResult.error(APIErrorType type, {String? message}) {
    return APIResult(
      error: APIErrorData(
        type: type,
        message: message,
      ),
    );
  }
  final T? data;
  final APIErrorData? error;
}
