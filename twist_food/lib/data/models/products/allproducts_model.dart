// To parse this JSON data, do
//
//     final allProductsModel = allProductsModelFromJson(jsonString);

import 'dart:convert';

List<AllProductsModel?>? allProductsModelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<AllProductsModel?>.from(
            json.decode(str)!.map((x) => AllProductsModel.fromJson(x)));

String allProductsModelToJson(List<AllProductsModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class AllProductsModel {
  AllProductsModel({
    this.categoryId,
    this.category,
    this.productName,
    this.productDescription,
    this.imagePath,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  int? categoryId;
  dynamic category;
  String? productName;
  String? productDescription;
  String? imagePath;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        categoryId: json["categoryId"],
        category: json["category"],
        productName: json["productName"],
        productDescription: json["productDescription"],
        imagePath: json["imagePath"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "category": category,
        "productName": productName,
        "productDescription": productDescription,
        "imagePath": imagePath,
        "price": price,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
      };
}
