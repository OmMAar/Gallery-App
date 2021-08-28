import 'dart:io';

import 'package:dio/dio.dart';

import 'base_errors/bad_request_error.dart';
import 'base_errors/base_error.dart';
import 'base_errors/cancel_error.dart';
import 'base_errors/conflict_error.dart';
import 'base_errors/custom_error.dart';
import 'base_errors/forbidden_error.dart';
import 'base_errors/http_error.dart';
import 'base_errors/internal_server_error.dart';
import 'base_errors/net_error.dart';
import 'base_errors/not_found_error.dart';
import 'base_errors/socket_error.dart';
import 'base_errors/timeout_error.dart';
import 'base_errors/unauthorized_error.dart';
import 'base_errors/unknown_error.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(dynamic error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
          "Received invalid status code: ${error.response?.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  static BaseError handleBaseError(DioError error) {
    if (error.type == DioErrorType.other ||
        error.type == DioErrorType.response) {
      if (error is SocketException) return SocketError();
      print("SocketException SocketException SocketException SocketException");
      if (error.type == DioErrorType.response) {
        print("DioErrorType.RESPONSE ${error.message}");
        print("DioErrorType.RESPONSE ${error.response}");
        switch (error.response!.statusCode) {
          case 400:
            return BadRequestError();
          case 401:
            return UnauthorizedHttpError();
          case 403:
            return ForbiddenError();
          case 404:
            return NotFoundError();
          case 409:
            return ConflictError();
          case 422:
            return CustomError();
          case 500:
            return InternalServerError();
          default:
            return HttpError();
        }
      }
      return NetError();
    } else if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return TimeoutError();
    } else if (error.type == DioErrorType.cancel) {
      return CancelError();
    } else
      return UnknownError();
  }
}