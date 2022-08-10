

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ActivateData ActivateDataFromJson(String str) => ActivateData.fromJson(json.decode(str));

String ActivateDataToJson(ActivateData data) => json.encode(data.toJson());


class ActivateData {
    ActivateData({
         this.UserName,
       
    });

    String? UserName;
   
    

    factory ActivateData.fromJson(Map<String, dynamic> json) => ActivateData(
        UserName: json["UserName"],
       
    );

    Map<String, dynamic> toJson() => {
        "UserName": UserName
    };
}
