import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:twist_food/data/services/api/api_client.dart';
import 'package:twist_food/data/services/api/custom_exception.dart';
import 'package:twist_food/utils/constants.dart';

class ApiService {
  ApiClient apiClient = ApiClient();

  Future<bool> sendCodeToPhone({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}user/send-to-phone-number",
        queryParameters: {
          'PhoneNumber': '+998$phoneNumber',
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } on DioError catch (e) {
      var message = CustomException.fromDioError(e).toString();
      showTopSnackBar(
          Overlay.of(context)!, CustomSnackBar.error(message: message));
      return false;
    }
  }

  Future<bool> verifyCode({
    required BuildContext context,
    required String phoneNumber,
    required int code,
  }) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}user/verify-phone-number",
        queryParameters: {
          'PhoneNumber': '+998$phoneNumber',
          'Code': code,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } on DioError catch (e) {
      var message = CustomException.fromDioError(e).toString();
      showTopSnackBar(
          Overlay.of(context)!, CustomSnackBar.error(message: message));
      return false;
    }
  }

  Future<bool> registerUser({
    required BuildContext context,
    required String userName,
    required String phoneNumber,
  }) async {
    try {
      Response response = await apiClient.dio.post(
        '${Constants.BASE_URL}user/register',
        data: {
          'TelegramId': '',
          'FullName': userName,
          'PhoneNumber': '+998$phoneNumber',
          "PhoneId": ''
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } on DioError catch (e) {
      var message = CustomException.fromDioError(e).toString();
      showTopSnackBar(
          Overlay.of(context)!, CustomSnackBar.error(message: message));
      return false;
    }
  }

  Future<String> loginUser(
      {required BuildContext context, required String phoneNumber}) async {
    try {
      Response response = await apiClient.dio.post(
        "${Constants.BASE_URL}user/login",
        data: {
          'PhoneNumber': '+998$phoneNumber',
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        return '';
      }
    } on DioError catch (e) {
      var message = CustomException.fromDioError(e).toString();
      showTopSnackBar(
          Overlay.of(context)!, CustomSnackBar.error(message: message));
      return '';
    }
  }
}
