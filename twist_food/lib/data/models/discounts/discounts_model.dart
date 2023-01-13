import 'dart:convert';

List<DiscountsModel?>? discountsModelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<DiscountsModel?>.from(
            json.decode(str)!.map((x) => DiscountsModel.fromJson(x)));

String discountsModelToJson(List<DiscountsModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class DiscountsModel {
  DiscountsModel({
    this.discountName,
    this.description,
    this.imagePath,
    this.startTime,
    this.endTime,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  String? discountName;
  String? description;
  String? imagePath;
  DateTime? startTime;
  DateTime? endTime;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;

  factory DiscountsModel.fromJson(Map<String, dynamic> json) => DiscountsModel(
        discountName: json["discountName"],
        description: json["description"],
        imagePath: json["imagePath"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "discountName": discountName,
        "description": description,
        "imagePath": imagePath,
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
        "price": price,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
      };
}
