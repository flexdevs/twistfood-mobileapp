import 'package:dio/dio.dart';
import 'package:twist_food/utils/constants.dart';

class ApiClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.BASE_URL,
      connectTimeout: 25000,
      receiveTimeout: 20000,
    ),
  );
}
