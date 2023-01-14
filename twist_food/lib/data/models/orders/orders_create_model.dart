// To parse this JSON data, do
//
//     final ordersCreateModel = ordersCreateModelFromJson(jsonString);

import 'dart:convert';

OrdersCreateModel? ordersCreateModelFromJson(String str) =>
    OrdersCreateModel.fromJson(json.decode(str));

String ordersCreateModelToJson(OrdersCreateModel? data) =>
    json.encode(data!.toJson());

class OrdersCreateModel {
  OrdersCreateModel({
    this.userId,
    this.user,
    this.deliverId,
    this.deliver,
    this.iLocationId,
    this.iLocation,
    this.totalSum,
    this.paymentType,
    this.status,
    this.deleviryPrice,
    this.isDiscount,
    this.discountId,
    this.discount,
    this.operatorId,
    this.ordersCreateModelOperator,
    this.deliveredAt,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  int? userId;
  User? user;
  dynamic deliverId;
  dynamic deliver;
  int? iLocationId;
  ILocation? iLocation;
  int? totalSum;
  int? paymentType;
  int? status;
  int? deleviryPrice;
  bool? isDiscount;
  dynamic discountId;
  dynamic discount;
  dynamic operatorId;
  dynamic ordersCreateModelOperator;
  dynamic deliveredAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;

  factory OrdersCreateModel.fromJson(Map<String, dynamic> json) =>
      OrdersCreateModel(
        userId: json["userId"],
        user: User.fromJson(json["user"]),
        deliverId: json["deliverId"],
        deliver: json["deliver"],
        iLocationId: json["iLocationId"],
        iLocation: ILocation.fromJson(json["iLocation"]),
        totalSum: json["totalSum"],
        paymentType: json["paymentType"],
        status: json["status"],
        deleviryPrice: json["deleviryPrice"],
        isDiscount: json["isDiscount"],
        discountId: json["discountId"],
        discount: json["discount"],
        operatorId: json["operatorId"],
        ordersCreateModelOperator: json["operator"],
        deliveredAt: json["deliveredAt"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "user": user!.toJson(),
        "deliverId": deliverId,
        "deliver": deliver,
        "iLocationId": iLocationId,
        "iLocation": iLocation!.toJson(),
        "totalSum": totalSum,
        "paymentType": paymentType,
        "status": status,
        "deleviryPrice": deleviryPrice,
        "isDiscount": isDiscount,
        "discountId": discountId,
        "discount": discount,
        "operatorId": operatorId,
        "operator": ordersCreateModelOperator,
        "deliveredAt": deliveredAt,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
      };
}

class ILocation {
  ILocation({
    this.latitude,
    this.longitude,
    this.id,
  });

  double? latitude;
  double? longitude;
  int? id;

  factory ILocation.fromJson(Map<String, dynamic> json) => ILocation(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "id": id,
      };
}

class User {
  User({
    this.telegramId,
    this.phoneNumber,
    this.fullName,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  String? telegramId;
  String? phoneNumber;
  String? fullName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        telegramId: json["telegramId"],
        phoneNumber: json["phoneNumber"],
        fullName: json["fullName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "telegramId": telegramId,
        "phoneNumber": phoneNumber,
        "fullName": fullName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
      };
}
