// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignupRequest _$$_SignupRequestFromJson(Map<String, dynamic> json) =>
    _$_SignupRequest(
      password: json['password'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      phoneNo: json['phoneNo'] as String,
      userType: json['userType'] as String,
      pcDomainName: json['pcDomainName'] as String,
      pcIpAddress: json['pcIpAddress'] as String,
      pcName: json['pcName'] as String,
      pcUserName: json['pcUserName'] as String,
    );

Map<String, dynamic> _$$_SignupRequestToJson(_$_SignupRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
      'userName': instance.userName,
      'phoneNo': instance.phoneNo,
      'userType': instance.userType,
      'pcDomainName': instance.pcDomainName,
      'pcIpAddress': instance.pcIpAddress,
      'pcName': instance.pcName,
      'pcUserName': instance.pcUserName,
    };
