import 'package:dio/dio.dart';

class CustomException implements Exception {
  String _message = '';
  CustomException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        _message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _message = "Connection timeout with API server";
        break;

      case DioErrorType.receiveTimeout:
        _message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        _message = _handleError(
          statusCode: dioError.response?.statusCode ?? 0,
          error: dioError.response!.statusMessage,
        );
        break;
      case DioErrorType.sendTimeout:
        _message = "Send timeout in connection with API server";
        break;
      default:
        _message = "Something went wrong";
        break;
    }
  }
  String _handleError({required int statusCode, required dynamic error}) {
    switch (statusCode) {
      case 400:
        return 'Code is wrong';
      case 404:
        return 'User not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => _message;
}
