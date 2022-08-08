
// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
    SignUp({
        required this.userName,
        required this.email,
        required this.password,
        required this.phoneNo,
        required this.userType,
        this.pcDomainName,
        this.pcIpAddress,
        this.pcName,
        this.pcUserName,
    });

    String userName;
    String email;
    String password;
    String phoneNo;
    int userType;
    String? pcDomainName;
    String? pcIpAddress;
    String? pcName;
    String? pcUserName;

    factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        phoneNo: json["phoneNo"],
        userType: json["userType"],
        pcDomainName: json["pcDomainName"],
        pcIpAddress: json["pcIpAddress"],
        pcName: json["pcName"],
        pcUserName: json["pcUserName"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
        "phoneNo": phoneNo,
        "userType": userType,
        "pcDomainName": pcDomainName,
        "pcIpAddress": pcIpAddress,
        "pcName": pcName,
        "pcUserName": pcUserName,
    };
}
