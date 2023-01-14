import 'package:json_annotation/json_annotation.dart';

part 'discounts_model.g.dart';

@JsonSerializable()
class DiscountsModel {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'discountName')
  String discountName;

  @JsonKey(defaultValue: 0, name: 'price')
  int price;

  @JsonKey(defaultValue: '', name: 'description')
  String description;

  @JsonKey(defaultValue: '', name: 'imagePath')
  String imagePath;

  @JsonKey(defaultValue: '', name: 'startTime')
  String startTime;

  @JsonKey(defaultValue: '', name: 'endTime')
  String endTime;

  @JsonKey(defaultValue: '', name: 'createdAt')
  String createdAt;

  @JsonKey(defaultValue: '', name: 'updatedAt')

  String updatedAt;

  DiscountsModel({
    required this.discountName,
    required this.description,
    required this.imagePath,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory DiscountsModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountsModelToJson(this);
}
