
// To parse this JSON data, do
//
//     final ValidateData = ValidateDataFromJson(jsonString);

import 'dart:convert';

ValidateData ValidateDataFromJson(String str) => ValidateData.fromJson(json.decode(str));

String ValidateDataToJson(ValidateData data) => json.encode(data.toJson());

class ValidateData {
    ValidateData({
        required this.userName,
        required this.otp,
    });

    String userName;
    String otp;
    

    factory ValidateData.fromJson(Map<String, dynamic> json) => ValidateData(
        userName: json["userName"],
        otp: json["otp"],
       
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "otp": otp,
      
    };
}
