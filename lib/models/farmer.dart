// To parse this JSON data, do
//
//     final farmerModel = farmerModelFromJson(jsonString);

import 'dart:convert';

FarmerModel farmerModelFromJson(String str) => FarmerModel.fromJson(json.decode(str));

String farmerModelToJson(FarmerModel data) => json.encode(data.toJson());

class FarmerModel {
  FarmerModel({
    this.farmerData,
  });

  List<Farmer>? farmerData;

  factory FarmerModel.fromJson(Map<String, dynamic> json) => FarmerModel(
        farmerData: List<Farmer>.from(
            json["farmerData"].map((x) => Farmer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "farmerData": List<dynamic>.from(farmerData!.map((x) => x.toJson())),
      };
}

class Farmer {
  Farmer({
    this.farmerId,
    this.farmerFirstName,
    this.farmerLastName,
    
  });

  int? farmerId;
  String? farmerFirstName;
  String? farmerLastName;

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        farmerId: json["oid"],
        farmerFirstName: json["firstName"],
        farmerLastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "oid": farmerId,
        "firstName": farmerFirstName,
        "lastName": farmerLastName,
      };
}