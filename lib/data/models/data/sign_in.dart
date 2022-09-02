
// To parse this JSON data, do
//
//final ValidateData = ValidateDataFromJson(jsonString);

import 'dart:convert';

SignIn SignInFromJson(String str) => SignIn.fromJson(json.decode(str));

String SignInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
    SignIn({
        required this.userName,
        required this.password
    });

    String userName;
    String password;

    factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        userName: json["userName"],
        password: json["password"]
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password
    };
}
