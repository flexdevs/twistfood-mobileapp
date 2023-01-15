// import 'package:json_annotation/json_annotation.dart';

// part 'discounts_model.g.dart';

// @JsonSerializable()
// class DiscountsModel {
//   @JsonKey(defaultValue: 0, name: 'id')
//   int id;

//   @JsonKey(defaultValue: '', name: 'discountName')
//   String discountName;

//   @JsonKey(defaultValue: 0, name: 'price')
//   int price;

//   @JsonKey(defaultValue: '', name: 'description')
//   String description;

//   @JsonKey(defaultValue: '', name: 'imagePath')
//   String imagePath;

//   @JsonKey(defaultValue: '', name: 'startTime')
//   String startTime;

//   @JsonKey(defaultValue: '', name: 'endTime')
//   String endTime;

//   @JsonKey(defaultValue: '', name: 'createdAt')
//   String createdAt;

//   @JsonKey(defaultValue: '', name: 'updatedAt')

//   String updatedAt;

//   DiscountsModel({
//     required this.discountName,
//     required this.description,
//     required this.imagePath,
//     required this.startTime,
//     required this.endTime,
//     required this.price,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.id,
//   });

//   factory DiscountsModel.fromJson(Map<String, dynamic> json) =>
//       _$DiscountsModelFromJson(json);

//   Map<String, dynamic> toJson() => _$DiscountsModelToJson(this);
// }

// To parse this JSON data, do
//
//     final discountsModel = discountsModelFromJson(jsonString);

import 'dart:convert';

List<DiscountsModel?>? discountsModelFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<DiscountsModel?>.from(
            json.decode(str)!.map((x) => DiscountsModel.fromJson(x)));

String discountsModelToJson(List<DiscountsModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

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
