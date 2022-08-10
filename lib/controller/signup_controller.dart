import 'package:dcms_app/core/http_client.dart';
import 'package:dcms_app/core/network_handler.dart';
import 'package:dcms_app/models/auth/sign_up.dart';
import 'package:dcms_app/view/screens/otp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


import '../core/api_service_provider.dart';
import '../data/api/api_client.dart';
import '../data/models/data/otp.dart';
import '../data/models/data/register.dart';
import '../data/models/response/response_model.dart';
import '../respository/auth_repo.dart';
import '../routes/auth_endpoints.dart';
import '../routes/base.dart';

class SignupController extends GetxController  implements GetxService {


  //  final AuthRepo authRepo;
  SignupController() {
    // _notification = authRepo.isNotificationActive();
  }

  bool _isLoading = false;
  bool _notification = true;

  bool get isLoading => _isLoading;
  bool get notification => _notification;
 
  Dio dio = Dio();
  final ApiServiceProvider _provider = ApiServiceProvider();

  late TextEditingController userNameController,
  emailController,
  passwordController,
  phoneNoController,
  pcDomainNameController,
  pcIpAddressController,
  pcNameController;
  RxString userType = "".obs;

  

  @override 
  void onInit() {
    super.onInit();
    
    userNameController = TextEditingController();
    emailController = TextEditingController(); 
    passwordController = TextEditingController(); 
    phoneNoController = TextEditingController(); 
    pcDomainNameController = TextEditingController(); 
    pcIpAddressController = TextEditingController(); 
    pcNameController = TextEditingController();
  }

  @override 
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose(); 
    passwordController.dispose(); 
    phoneNoController.dispose(); 
    pcDomainNameController.dispose(); 
    pcIpAddressController.dispose(); 
    pcNameController.dispose();
  }


  Future<dynamic> registration(SignUp signUpBody) async {
    _isLoading = true;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', signUpBody.userName.toString());


    update();
    var response =   await dio.post(BaseEndpoint.baseUrl+Endpoints.signup, data: signUpBody.toJson());
    
      if (response.statusCode == 201 || response.statusCode == 200) {
       
        print('Registration Successful $response');
       
        Fluttertoast.showToast(
          msg: "Account Created Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
        );
        _isLoading = false;
        Get.to(OtpPage());

      } else {
              print('Registration Failed $response');

              Fluttertoast.showToast(
                msg: "Failed: $response",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
              );
      _isLoading = false;
      update();
      }
      
      return response.statusCode;
    
  }




    // await _provider.sendPost(BaseEndpoint.baseUrl+Endpoints.signup,  signUpBody.toJson());

  // Future<dynamic> activateAccount(SignUp signUpBody) async {
  //   _isLoading = true;
  //   update();
  //   var response =  await dio.post(BaseEndpoint.baseUrl+Endpoints.signup, data: signUpBody.toJson());
  //  //  await authRepo.registration(signUpBody);
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       print('Registration Successful $response');
       

  //       Fluttertoast.showToast(
  //         msg: "Account Created Success",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.TOP_RIGHT,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //       );
  //       Get.to(OtpPage());

        

  //     } else {
  //             print('Registration Failed $response');

  //             Fluttertoast.showToast(
  //               msg: "Unable to create Account",
  //               toastLength: Toast.LENGTH_SHORT,
  //               gravity: ToastGravity.TOP_RIGHT,
  //               timeInSecForIosWeb: 1,
  //               backgroundColor: Colors.red,
  //               textColor: Colors.white,
  //               fontSize: 16.0
  //             );
  //     }
  //     _isLoading = false;
  //     update();
  //     return response.statusCode;
    
  // }


}