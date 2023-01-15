import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:twist_food/data/models/categories/allcategories_model.dart';
import 'package:twist_food/data/models/discounts/discounts_model.dart';
import 'package:twist_food/data/models/orders/orders_create_model.dart';
import 'package:twist_food/data/models/products/allproducts_model.dart';
import 'package:twist_food/data/models/products/productsbyid_model.dart';
import 'package:twist_food/data/models/search/search_product_name_model.dart';
import 'package:twist_food/data/services/api/api_client.dart';
import 'package:twist_food/data/services/api/custom_exception.dart';
import 'package:twist_food/utils/constants.dart';
import 'package:twist_food/utils/helper.dart';

class OpenApiService {
  ApiClient apiClient = ApiClient();

  // GET Categories
  Future<List<AllCategoriesModel>> getCategories({
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
      throw Exception(e);
    }
  }

  // GET Discounts
  Future<List<DiscountsModel>> getDiscounts({
    int page = 1,
  }) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}discounts?=$page",
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
      
      throw Exception(e);
    }
  }

  // GET All Produts
  Future<List<AllProductsModel>> getAllProducts({
    int page = 1,
  }) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}products?=$page",
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
      throw Exception(e);
    }
  }

  // GET products by id
  Future<ProductsByIdModel> getProductById({
    required int id,
  }) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}products/$id",
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  //  Search Product by name
  Future<List<SearchProductNameModel>> searchByProductName({
    required String searchName,
  }) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}products/search/$searchName",
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
      throw Exception(e);
    }
  }

  //  Search by product and categories name
  Future<List<SearchProductNameModel>> searchProduct(
      [String? searchName, String? categryName]) async {
    try {
      Response response = await apiClient.dio.get(
        "${Constants.BASE_URL}products/searchAll?categryName=$categryName&searchname=$searchName",
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
      throw Exception(e);
    }
  }

  Future<OrdersCreateModel> createOrder(
      {required int userId,
      required double lat,
      required double long,
      required double deliverPrice,
      required bool isDiscount,
      int? disCountId}) async {
    try {
      Response response = await apiClient.dio.post(
        "${Constants.BASE_URL}orders/Create",
        data: {
          'UserId': userId,
          'Latitude': lat,
          'Longitude': long,
          'DeliverPrice': deliverPrice,
          'IsDiscount': isDiscount,
          'DiscountId': disCountId,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
