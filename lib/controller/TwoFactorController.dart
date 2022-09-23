// ignore_for_file: unused_field

import 'package:dcms_app/data/models/data/activation.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:dcms_app/view/screens/dashboard.dart';
import 'package:dcms_app/view/screens/home.dart';
import 'package:dcms_app/view/screens/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api_service_provider.dart';
import '../data/models/data/otp.dart';
import '../routes/auth_endpoints.dart';

class TwoFactorController extends GetxController {

  var isLoading = false.obs;
  final ApiServiceProvider _provider = ApiServiceProvider();
  late SharedPreferences _prefs;
  Dio dio = Dio();


  Future<dynamic> validateTwoFactor(ValidateData validateDataBody) async {
   _prefs = await SharedPreferences.getInstance();
  
    isLoading(true);
    update();
    var response =  await _provider.sendPost(Endpoints.validateTwoFactorToken, validateDataBody.toJson());
      if (response.statusCode != 201 || response.statusCode != 200) {
        print('Successful $response');

         Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp
        );
        update();

        Get.to(Home());
        isLoading(false);

      }
      
      print('Validation Failed $response');
      isLoading(false);
      update();
      return response.statusCode;
    
  }


}