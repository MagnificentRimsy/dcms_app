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
import '../utils/app_snacks.dart';

class BatchController extends GetxController with StateMixin<List<dynamic>> {
  RxBool isLoading = false.obs;
  final ApiServiceProvider _provider = ApiServiceProvider();
  late SharedPreferences _prefs;
  RxString batchDescriptionText = ''.obs;
  Dio dio = Dio(); 
  late TextEditingController batchDescriptionController;


  // Get Batches
    var listBatch = List<dynamic>.empty(growable: true).obs;
    var page = 1;
    var isDataProcessing = false.obs;
    // For Pagination
    ScrollController scrollController = ScrollController();
    var isMoreDataAvailable = true.obs;


    RxString username = ''.obs;

      @override
      void onInit() async{
        super.onInit();
        batchDescriptionController = TextEditingController();
        _getBatches ();
      }


  _getBatches () async {
      _prefs = await  SharedPreferences.getInstance();
      BatchProvider().getBatches(_prefs.getString('username') ).then((value) {
        change(value, status: RxStatus.success());
      },onError: (error){
        change(null,status: RxStatus.error(error.toString()));
      });
  }

  @override
  void onClose() {
    super.onClose();
    batchDescriptionController.dispose();
  }

 
  createBatch(BuildContext context, Batch batchDataBody) async {

    try {

      isLoading(true);
      update();
      String url = BaseEndpoint.baseUrl+Endpoints.createBatch;
      print(url);
      print('batch-data ${batchDataBody.description}');
      Response response = await dio.post(url, data: batchDataBody.toJson());
      print (response.data);
      if ( response.statusCode == 201 ) {

        isLoading(false);
        Navigator.pop(context);
        AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Batch Created Success!');
        _getBatches();
        update();
        return response.data;
      }
      
    } catch (e) {
      print('Operation Failed $e');
      isLoading(false);
      update();
      return e.toString();
    }
  }
}

