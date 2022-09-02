import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_client.dart';
import '../data/models/data/register.dart';
import '../routes/auth_endpoints.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences? sharedPreferences;
  AuthRepo({required this.apiClient,  this.sharedPreferences});

  // Future<Response> registration(SignUp signUpBody) async {
  //   return await apiClient.postData(Endpoints.signup, signUpBody.toJson(), headers: { 'Content-type': 'application/json',
  //             'Accept': 'application/json',
  //             "Authorization": "Some token"});
  // }
  // Future<Response> login({String phone, String password}) async {
  //   return await apiClient.postData(AppConstants.LOGIN_URI, {"phone": phone, "password": password});
  // }

}
