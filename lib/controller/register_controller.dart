
import 'package:dcms_app/view/screens/otp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api_service_provider.dart';
import '../data/models/data/register.dart';
import '../routes/auth_endpoints.dart';
import '../routes/base.dart';

class RegistrationController extends GetxController implements GetxService {
  //  final AuthRepo authRepo;
  RegistrationController() {
    // _notification = authRepo.isNotificationActive();
  }

  var isLoading = false.obs;
  bool _notification = true;

  bool get notification => _notification;

  Dio dio = Dio();
  late SharedPreferences _prefs;

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
   isLoading(true) ;
    final prefs = await SharedPreferences.getInstance();


    update();
    Response response = await dio.post(BaseEndpoint.baseUrl + Endpoints.signup,
        data: signUpBody.toJson());

    if (response.data['statusCode'] != 201) {
      print('Registration Successful $response');
      
    await prefs.setString('username', signUpBody.userName);

      Fluttertoast.showToast(
          msg: "Account Created Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp);
      isLoading(false);
      Get.to(OtpPage(), transition: Transition.rightToLeft, arguments: signUpBody.userName);
    } else {
      print('Registration Failed $response');

      Fluttertoast.showToast(
          msg: "Failed: $response",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0.sp);
     isLoading(false);
      update();
    }

    return response.data;
  }

}
