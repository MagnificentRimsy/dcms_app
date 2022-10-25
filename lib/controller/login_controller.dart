// ignore_for_file: unused_field, unused_import

import 'dart:convert';
import 'package:dcms_app/data/models/data/sign_in.dart';
import 'package:dcms_app/data/models/data/two_factor.dart';
import 'package:dcms_app/routes/app_routes.dart';
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
import '../utils/app_snacks.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final ApiServiceProvider _provider = ApiServiceProvider();
  late SharedPreferences _prefs;

  RxString userNameText = ''.obs;

  Dio dio = Dio();

  late TextEditingController userNameController, passwordController;

  @override
  void onInit() {
    super.onInit();

    userNameController = TextEditingController();
    passwordController = TextEditingController();

    userNameController.addListener(() {
      userNameText.value = userNameController.text;
    });
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }

  Future<dynamic> loginAccount(BuildContext context, SignIn signInDataBody) async {

    try {
      _prefs = await SharedPreferences.getInstance();

      isLoading(true);
      update();
      String url = BaseEndpoint.baseUrl+Endpoints.login+ signInDataBody.userName+'&Password='+signInDataBody.password;
      print(url);
      print('user-data ${signInDataBody.userName}  ${signInDataBody.password}');
      Response response = await dio.post(url, data: '');

        
           print (response.data['value']['isActive']); 
        _prefs.setInt('useroid', response.data['value']['entityOid']);
        _prefs.setInt('usertype', response.data['value']['userType']);
        _prefs.setString('username', response.data['value']['userName']); 
        _prefs.setString('userdescription', response.data['value']['userTypeDescription']); 
        _prefs.setInt('entityoid', response.data['value']['entityOid']); 

        SharedPreferences prefs = await SharedPreferences.getInstance();
          var storedusername = prefs.getString('username');
          var storeduserdescription = prefs.getString('userdescription');
          var storedentitytype = prefs.getInt('entityoid');

          print('Username ---- $storedusername');
          print('UserDescription ---- $storeduserdescription');
          print('UserType ---- $storedentitytype');

 
          Future.delayed(Duration(seconds: 0), () {
            AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Login Successful');
          });

                isLoading(false);
              
                if (storeduserdescription =="Agent" && storedentitytype == 0) 
                {
                  Get.offNamed('/agentprofile',  arguments: response);
                } else if(storeduserdescription =="Farmer" && storedentitytype == 0){
                  Get.offNamed('/farmerprofile', arguments: response, );        
                }else{
                  Get.offNamed('/home', arguments: response);   
                }
        
                update();
                isLoading(false);
                return AppSnacks.show(context, leadingIcon: Icon(Icons.error), message:'Login Failed' );
        

     // Get.offNamed('/home', arguments: response);

        

        //  GetTwoFaBody getTwofactorBody = GetTwoFaBody(reason: 3, requester: signInDataBody.userName, status: 0);


        // Response generateOtp = await dio.post(BaseEndpoint.baseUrl+Endpoints.GenerateOtp, data: getTwofactorBody.toJson() );
        // if (generateOtp.data['statusCode'] == 200)
        // {
        //   AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Login Successful');
        //   update();

        //   isLoading(false);
        //   Get.to(Home(), arguments: response.data['value']['userName']);
        // }else {
         
        //   AppSnacks.show(context, message: 'Login Failed');
        //   update();

        //   isLoading(false);
        // }
        

     // }else {
    
        // AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Login Successful');

        // update();

        // isLoading(false);
        // Get.to(Home(), arguments: response);
      //}
    }on DioError catch (e) {
      if(e.type == DioErrorType.response ){
          isLoading(false);
          print('Login Failed $e');
          AppSnacks.show(context, leadingIcon: Icon(Icons.error), message:'Incorrect Username or Password!' );
          update();
          return e;
      }if(e.type == DioErrorType.connectTimeout){
          isLoading(false);
          print('Connection Timeout $e');
          AppSnacks.show(context, leadingIcon: Icon(Icons.error), message:'Connection Timeout!' );
          update();
          return e;
      }if (e.type == DioErrorType.receiveTimeout){
          isLoading(false);
          print('Unable to Connect $e');
          AppSnacks.show(context, leadingIcon: Icon(Icons.error), message:'Unable to connect to server!' );
          update();
          return e;
      }if (e.type == DioErrorType.other){
          isLoading(false);
          print(' Something went Wrong $e');
          AppSnacks.show(context, leadingIcon: Icon(Icons.error), message:'Something went wrong!' );
          update();
          return e;
      }
    
    } catch (e){
          isLoading(false);
          print('Failed $e');
          AppSnacks.show(context, leadingIcon: Icon(Icons.error), message:'Login Failed!' );
          update();
          return e; 
    }
  }
}

