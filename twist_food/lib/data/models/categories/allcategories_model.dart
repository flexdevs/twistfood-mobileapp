// To parse this JSON data, do
//
//     final allCategoriesModel = allCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<AllCategoriesModel?>? allCategoriesModelFromJson(String str) => json.decode(str) == null ? [] : List<AllCategoriesModel?>.from(json.decode(str)!.map((x) => AllCategoriesModel.fromJson(x)));

String allCategoriesModelToJson(List<AllCategoriesModel?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class AllCategoriesModel {
    AllCategoriesModel({
        this.categoryName,
        this.productCount,
        this.id,
    });

    String? categoryName;
    int? productCount;
    int? id;
    factory AllCategoriesModel.fromJson(Map<String, dynamic> json) => AllCategoriesModel(
        categoryName: json["categoryName"],
        productCount: json["productCount"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "productCount": productCount,
        "id": id,
    };
}
