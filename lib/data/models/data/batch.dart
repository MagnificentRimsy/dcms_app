// To parse this JSON data, do
//
//     final batch = batchFromJson(jsonString);

import 'dart:convert';

Batch batchFromJson(String str) => Batch.fromJson(json.decode(str));

String batchToJson(Batch data) => json.encode(data.toJson());

class Batch {
    Batch({
        this.createdBy,
        this.createdOn,
        this.pcDomainName,
        this.pcIpAddress,
        this.pcName,
        this.pcUserName,
        required this.description,
        required this.seasonOid,
        required this.userName,
    });

    String? createdBy;
    DateTime? createdOn;
    String? pcDomainName;
    String? pcIpAddress;
    String? pcName;
    String? pcUserName;
    String description;
    int seasonOid;
    String userName;

    factory Batch.fromJson(Map<String, dynamic> json) => Batch(
        createdBy: json["createdBy"],
        createdOn: DateTime.parse(json["createdOn"]),
        pcDomainName: json["pcDomainName"],
        pcIpAddress: json["pcIpAddress"],
        pcName: json["pcName"],
        pcUserName: json["pcUserName"],
        description: json["description"],
        seasonOid: json["seasonOid"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdOn": createdOn.toString(),
        "pcDomainName": pcDomainName,
        "pcIpAddress": pcIpAddress,
        "pcName": pcName,
        "pcUserName": pcUserName,
        "description": description,
        "seasonOid": seasonOid,
        "userName": userName,
    };
}
