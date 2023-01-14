import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twist_food/data/services/api/custom_exception.dart';
import 'package:twist_food/main.dart';
import 'package:twist_food/utils/constants.dart';
import 'package:twist_food/utils/helper.dart';

class ApiClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.BASE_URL,
      connectTimeout: 25000,
      receiveTimeout: 20000,
    ),
  );

  ApiClient() {
    _init();
  }

  Future _init() async {
    dio.interceptors.add(
      (InterceptorsWrapper(
        onError: (error, handler) async {
          print("ON ERRORGA KIRDI");
          switch (error.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
              throw DeadlineExceededException(error.requestOptions);
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                  snackbarKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(
                          BadRequestException(error.requestOptions).toString()),
                    ),
                  );
                  return;
                case 401:
                  throw UnauthorizedException(error.requestOptions);
                case 404:
                  snackbarKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(
                          NotFoundException(error.requestOptions).toString()),
                    ),
                  );
                  return;
                case 409:
                  snackbarKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(
                          ConflictException(error.requestOptions).toString()),
                    ),
                  );
                  return;
                case 500:
                  snackbarKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(
                          InternalServerErrorException(error.requestOptions)
                              .toString()),
                    ),
                  );
                  return;
              }
              break;
            case DioErrorType.cancel:
              break;
            case DioErrorType.other:
              throw NoInternetConnectionException(error.requestOptions);
          }
          debugPrint('Error Status Code:${error.response?.statusCode}');
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) {
          print("ON REQUESTGA KIRDI");

          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          print("ON RESPONSEGA KIRDI");
          return handler.next(response);
        },
      )),
    );
  }
}
