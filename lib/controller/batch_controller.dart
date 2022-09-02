// ignore_for_file: unused_field, unused_import

import 'dart:convert';
import 'package:dcms_app/data/models/data/batch.dart';
import 'package:dcms_app/data/models/data/sign_in.dart';
import 'package:dcms_app/data/models/data/two_factor.dart';
import 'package:dcms_app/view/screens/dashboard.dart';
import 'package:dcms_app/view/screens/home.dart';
import 'package:dcms_app/view/screens/two_factor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api_service_provider.dart';
import '../models/auth/user.dart';
import '../routes/auth_endpoints.dart';
import '../routes/base.dart';
import '../utils/app_snacks.dart';

class BatchController extends GetxController {
  var isLoading = false.obs;
  final ApiServiceProvider _provider = ApiServiceProvider();
  late SharedPreferences _prefs;

  RxString batchDescriptionText = ''.obs;

  Dio dio = Dio();

  late TextEditingController batchDescriptionController, passwordController;

  @override
  void onInit() {
    super.onInit();

    batchDescriptionController = TextEditingController();
    
  }

  @override
  void onClose() {
    super.onClose();
    batchDescriptionController.dispose();
    passwordController.dispose();
  }

  Future<dynamic> loginAccount(BuildContext context, Batch batchDataBody) async {

    try {
      _prefs = await SharedPreferences.getInstance();

      isLoading(true);
      update();
      String url = BaseEndpoint.baseUrl+Endpoints.createBatch;
      print(url);
      print('batch-data ${batchDataBody.description}');
      Response response = await dio.post(url, data: batchDataBody.toJson());
      print (response.data['value']['isActive']);
      var userType = _prefs.setInt('userType', response.data['value']['userType']);
      print('UserType ---- $userType');
      if ( response.statusCode == 200 && response.data['value']['isActive'] == true) {
         GetTwoFaBody getTwofactorBody = GetTwoFaBody(reason: 3, requester: signInDataBody.batchDescription, status: 0);


        Response generateOtp = await dio.post(BaseEndpoint.baseUrl+Endpoints.GenerateOtp, data: getTwofactorBody.toJson() );
        if (generateOtp.data['statusCode'] == 200)
        {
          AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Login Successful');
          update();

          isLoading(false);
          Get.to(Home(), arguments: response.data['value']['batchDescription']);
        }else {
         
          AppSnacks.show(context, message: 'Login Failed');
          update();

          isLoading(false);
        }
        

      }else {
    
        AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Login Successful');

        update();

        isLoading(false);
        Get.to(Home(), arguments: response);
      }
    } catch (e) {
      print('Login Failed $e');
      isLoading(false);
      AppSnacks.show(context, leadingIcon: Icon(Icons.error), message: 'Login Failed: $e');
      print('Login Failed, batchDescription or password $e');
      update();
      return e;
    }
  }
}

