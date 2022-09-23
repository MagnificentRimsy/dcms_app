// To parse this JSON data, do
//
//     final farmModel = farmModelFromJson(jsonString);

import 'dart:convert';

FarmModel farmModelFromJson(String str) =>
    FarmModel.fromJson(json.decode(str));

String farmModelToJson(FarmModel data) => json.encode(data.toJson());

class FarmModel {
  FarmModel({
    this.farmData,
  });

  List<Farm>? farmData;

  factory FarmModel.fromJson(Map<String, dynamic> json) => FarmModel(
        farmData: List<Farm>.from(
            json["farmData"].map((x) => Farm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "farmData": List<dynamic>.from(farmData!.map((x) => x.toJson())),
      };
}

class Farm {
  Farm({
    this.farmId,
    this.farmName,
  });

  int? farmId;
  String? farmName;

  factory Farm.fromJson(Map<String, dynamic> json) => Farm(
        farmId: json["farmId"],
        farmName: json["farmName"],
      );

  Map<String, dynamic> toJson() => {
        "farmId": farmId,
        "farmName": farmName,
      };
}