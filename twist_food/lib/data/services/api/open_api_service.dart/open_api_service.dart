import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:twist_food/data/models/categories/allcategories_model.dart';
import 'package:twist_food/data/services/api/api_client.dart';
import 'package:twist_food/data/services/api/custom_exception.dart';
import 'package:twist_food/utils/constants.dart';

class OpenApiService {
  ApiClient apiClient = ApiClient();

   Future<List<AllCategoriesModel>> getProducts({
    required BuildContext context,
    int page = 1,
  }) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}categories?page=$page",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } on DioError catch (e) {
      var message = CustomException.fromDioError(e).toString();
      showTopSnackBar(
          Overlay.of(context)!, CustomSnackBar.error(message: message));
      return [];
    }
  }
}
