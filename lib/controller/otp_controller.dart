// ignore_for_file: unused_field

import 'package:dcms_app/data/models/data/activation.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:dcms_app/view/screens/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api_service_provider.dart';
import '../data/models/data/otp.dart';
import '../routes/endpoints.dart';

class OtpController extends GetxController {

  var isLoading = false.obs;
  final ApiServiceProvider _provider = ApiServiceProvider();
  late SharedPreferences _prefs;
  Dio dio = Dio();


  Future<dynamic> validateOtp(ValidateData validateDataBody) async {
   _prefs = await SharedPreferences.getInstance();
        ActivateData activateData;

  
    isLoading(true);
    update();
    var response =  await _provider.sendPost(Endpoints.validateOtp, validateDataBody.toJson());
      if (response.statusCode != 201 || response.statusCode != 200) {
        print('Successful $response');

         Fluttertoast.showToast(
          msg: "Account Activating...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp
        );
        update();

        var activation =  await dio.post(BaseEndpoint.baseUrl+Endpoints.activateAccount+validateDataBody.userName, data: '');
        if (activation.statusCode != 200 || response.statusCode != 200) {
          Fluttertoast.showToast(
            msg: "Account Activated!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP_RIGHT,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0.sp
            );
          
          Get.to(LoginScreen());
        }
        isLoading(false);

      }
      
      print('Validation Failed $response');
      isLoading(false);
      update();
      return response.statusCode;
    
  }


}