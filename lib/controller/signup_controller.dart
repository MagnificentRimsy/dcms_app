import 'package:dcms_app/core/http_client.dart';
import 'package:dcms_app/core/network_handler.dart';
import 'package:dcms_app/models/auth/sign_up.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../data/models/data/register.dart';
import '../data/models/response/response_model.dart';
import '../respository/auth_repo.dart';
import '../routes/auth_endpoints.dart';
import '../routes/base.dart';

class SignupController extends GetxController  implements GetxService {


  final AuthRepo authRepo;
  SignupController({required this.authRepo}) {
  //  _notification = authRepo.isNotificationActive();
  }

  bool _isLoading = false;
  bool _notification = true;


  bool get isLoading => _isLoading;
  bool get notification => _notification;
 
  Dio dio = Dio();
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
    update();
    var response = await authRepo.registration(signUpBody);
    
    //  await dio.post(BaseEndpoint.baseUrl+AuthEndpoints.signup, data: signUpBody.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      print('Registration Successful');
      print(response);

    } else {
            print('Registration Failed');
            print(response);
    }
    _isLoading = false;
    update();
    return response.statusCode;
    
  }
}