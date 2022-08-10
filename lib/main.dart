import 'package:dcms_app/controller/signup_controller.dart';
import 'package:dcms_app/view/screens/dashboard.dart';
import 'package:dcms_app/view/screens/home.dart';
import 'package:dcms_app/view/screens/landing.dart';
import 'package:dcms_app/view/screens/login.dart';
import 'package:dcms_app/view/screens/onboarding.dart';
import 'package:dcms_app/view/screens/otp.dart';
import 'package:dcms_app/view/screens/register.dart';
import 'package:dcms_app/view/screens/settings.dart';
import 'package:dcms_app/view/screens/splash.dart';
import 'package:dcms_app/view/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/otp_controller.dart';
import 'data/api/api_client.dart';
import 'respository/auth_repo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

// void dependencies () {
//       // Get.lazyPut<SignupController>(() => SignupController(authRepo: AuthRepo(apiClient: ApiClient()),));

// }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    // Get.lazyPut<AuthRepo>(()=> AuthRepo( apiClient: ApiClient()));

    // authRepo: AuthRepo(apiClient: ApiClient()),
 Get.lazyPut<SignupController>(() => SignupController());
 Get.lazyPut<OtpController>(() => OtpController());


    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
      return GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.green,
          primaryColor: Color(0xFF00A850),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          // ignore: prefer_const_constructors
          '/splash': (context) => SplashScreen(),
          '/onboarding': (context) => OnboardingScreen(),
          '/landing': (context) => LandingScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/otp' : (context) => OtpPage(),
          '/dashboard': (context) => Dashboard(pageIndex: 0,),
          '/home': (context) => Home(),
          '/settings': (context) => SettingsScreen(),
          '/wallet': (context) => WalletScreen()
        },
        home: LoginScreen(),
      );}
    );
  }
}
