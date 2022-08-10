// import 'dart:core';
// import 'dart:convert';
// import 'package:dcms_app/view/screens/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RouteHelper {
//           static const String initial = '/';
//           static const String splash = '/splash';
//           static const String onBoarding = '/on-boarding';
//           static const String signIn = '/sign-in';
//           static const String signUp = '/sign-up';
//           static const String verification = '/verification';
//           static const String dashboard = '/dashboard';
//           static const String home = '/home';
//           static const String settings = '/settings';
//           static const String wallet = '/wallet';
//           static const String profile = '/profile';
//           static const String updateProfile = '/update-profile';
//           static const String forgotPassword = '/forgot-password';
//           static const String resetPassword = '/reset-password';
//           static const String search = '/search';


//           static String getInitialRoute() => '$initial';
//           static String getSplashRoute() => '$splash';
//           static String getOnBoardingRoute() => '$onBoarding';
//           static String getSignInRoute(String page) => '$signIn?page=$page';
//           static String getSignUpRoute() => '$signUp';
//           static String getVerificationRoute(String number, String token, String page, String pass) {
//             return '$verification?page=$page&number=$number&token=$token&pass=$pass';
//           }


//           static List<GetPage> routes = [
//             GetPage(name: initial, page:() => getRoute(Dashboard(pageIndex: 0)))
//           ];

          
//   static getRoute(Widget navigateTo) {
//     int _minimumVersion = 0;
//     if(GetPlatform.isAndroid) {
//       _minimumVersion = Get.find<SplashController>().configModel.appMinimumVersionAndroid;
//     }else if(GetPlatform.isIOS) {
//       _minimumVersion = Get.find<SplashController>().configModel.appMinimumVersionIos;
//     }
//     return AppConstants.APP_VERSION < _minimumVersion ? UpdateScreen(isUpdate: true)
//         : Get.find<SplashController>().configModel.maintenanceMode ? UpdateScreen(isUpdate: false)
//         : Get.find<LocationController>().getUserAddress() == null
//         ? AccessLocationScreen(fromSignUp: false, fromHome: false, route: Get.currentRoute) : navigateTo;
//   }
         
// }