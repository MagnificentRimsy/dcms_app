// To parse this JSON data, do
//
//     final getTwoFaBody = getTwoFaBodyFromJson(jsonString);

import 'dart:convert';

GetTwoFaBody getTwoFaBodyFromJson(String str) => GetTwoFaBody.fromJson(json.decode(str));

String getTwoFaBodyToJson(GetTwoFaBody data) => json.encode(data.toJson());

class GetTwoFaBody {
    GetTwoFaBody({
        required this.reason,
        required this.requester,
        required this.status,
        this.pcDomainName,
        this.pcIpAddress,
        this.pcName,
        this.pcUserName,
    });

    int reason;
    String requester;
    int status;
    String? pcDomainName;
    String? pcIpAddress;
    String? pcName;
    String? pcUserName;

    factory GetTwoFaBody.fromJson(Map<String, dynamic> json) => GetTwoFaBody(
        reason: json["reason"],
        requester: json["requester"],
        status: json["status"],
        pcDomainName: json["pcDomainName"],
        pcIpAddress: json["pcIpAddress"],
        pcName: json["pcName"],
        pcUserName: json["pcUserName"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
        "requester": requester,
        "status": status,
        "pcDomainName": pcDomainName,
        "pcIpAddress": pcIpAddress,
        "pcName": pcName,
        "pcUserName": pcUserName,
    };
}
