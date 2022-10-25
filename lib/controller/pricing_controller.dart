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
import '../routes/endpoints.dart';
import '../routes/base.dart';
import '../services/batch_service_provider.dart';
import '../services/pricing_service_provider.dart';
import '../utils/app_snacks.dart';

class 
PricingController extends GetxController with StateMixin<List<dynamic>> {
  RxBool isLoading = false.obs;
  late SharedPreferences _prefs;

  @override
  void onInit() async{
    super.onInit();
    getPricing ();
  }

  @override
  void onClose() {
    super.onClose();
  }

  
  getPricing () async {
      _prefs = await  SharedPreferences.getInstance();
      PricingProvider().getRecentMarketPrice().then((value) {
        change(value, status: RxStatus.success());
      },onError: (error){

      change(null,status: RxStatus.error(error.toString()));
      });
  }

}



