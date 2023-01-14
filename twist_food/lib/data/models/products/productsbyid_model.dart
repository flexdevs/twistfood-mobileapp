// To parse this JSON data, do
//
//     final productsByIdModel = productsByIdModelFromJson(jsonString);

import 'dart:convert';

ProductsByIdModel? productsByIdModelFromJson(String str) =>
    ProductsByIdModel.fromJson(json.decode(str));

String productsByIdModelToJson(ProductsByIdModel? data) =>
    json.encode(data!.toJson());

class ProductsByIdModel {
  ProductsByIdModel({
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

  factory ProductsByIdModel.fromJson(Map<String, dynamic> json) =>
      ProductsByIdModel(
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
