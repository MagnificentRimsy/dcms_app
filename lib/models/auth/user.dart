// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.statusCode,
        this.message,
        this.value,
    });

    String? statusCode;
    String? message;
    Value? value;

    factory User.fromJson(Map<String, dynamic> json) => User(
        statusCode: json["statusCode"],
        message: json["message"],
        value: Value.fromJson(json["value"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "value": value!.toJson(),
    };
}

class Value {
    Value({
        required this.oid,
        required this.userName,
        required this.email,
        required this.isActive,
        required this.photo,
        required this.phoneNo,
        required this.enable2Fa,
        required this.fullName,
        required this.userType,
        required this.userTypeDescription,
        required this.roles,
        required this.token,
    });

    String oid;
    String userName;
    String email;
    bool isActive;
    dynamic photo;
    String phoneNo;
    bool enable2Fa;
    dynamic fullName;
    int userType;
    String userTypeDescription;
    List<Role> roles;
    String token;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        oid: json["oid"],
        userName: json["userName"],
        email: json["email"],
        isActive: json["isActive"],
        photo: json["photo"],
        phoneNo: json["phoneNo"],
        enable2Fa: json["enable2FA"],
        fullName: json["fullName"],
        userType: json["userType"],
        userTypeDescription: json["userTypeDescription"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "oid": oid,
        "userName": userName,
        "email": email,
        "isActive": isActive,
        "photo": photo,
        "phoneNo": phoneNo,
        "enable2FA": enable2Fa,
        "fullName": fullName,
        "userType": userType,
        "userTypeDescription": userTypeDescription,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "token": token,
    };
}

class Role {
    Role({
        required this.roleId,
        required this.name,
        required this.isAdministrative,
        required this.canEditModel,
        // required this.navigationPermissions,
        // required this.permissionPolicies,
        // required this.actionPermissions,
    });

    String roleId;
    String name;
    bool isAdministrative;
    bool canEditModel;
    // List<NavigationPermission> navigationPermissions;
    // List<PermissionPolicy> permissionPolicies;
    // List<ActionPermission> actionPermissions;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["roleId"],
        name: json["name"],
        isAdministrative: json["isAdministrative"],
        canEditModel: json["canEditModel"],
      //  navigationPermissions: List<NavigationPermission>.from(json["navigationPermissions"].map((x) => NavigationPermission.fromJson(x))),
       // permissionPolicies: List<PermissionPolicy>.from(json["permissionPolicies"].map((x) => PermissionPolicy.fromJson(x))),
      //  actionPermissions: List<ActionPermission>.from(json["actionPermissions"].map((x) => ActionPermission.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "roleId": roleId,
        "name": name,
        "isAdministrative": isAdministrative,
        "canEditModel": canEditModel,
        // "navigationPermissions": List<dynamic>.from(navigationPermissions.map((x) => x.toJson())),
        // "permissionPolicies": List<dynamic>.from(permissionPolicies.map((x) => x.toJson())),
        // "actionPermissions": List<dynamic>.from(actionPermissions.map((x) => x.toJson())),
    };
}
