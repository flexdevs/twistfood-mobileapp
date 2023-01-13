import 'dart:convert';

List<SearchProductNameModel?>? searchProductNameModelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<SearchProductNameModel?>.from(
            json.decode(str)!.map((x) => SearchProductNameModel.fromJson(x)));

String searchProductNameModelToJson(List<SearchProductNameModel?>? data) =>
    json.encode(
        data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class SearchProductNameModel {
  SearchProductNameModel({
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

  factory SearchProductNameModel.fromJson(Map<String, dynamic> json) =>
      SearchProductNameModel(
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
