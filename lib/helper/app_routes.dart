// ignore_for_file: prefer_const_constructors

import 'package:dcms_app/models/transaction.dart';
import 'package:dcms_app/view/screens/batches.dart';
import 'package:get/get.dart';

import '../bindings/databinding.dart';
import '../view/screens/dashboard.dart';
import '../view/screens/home.dart';
import '../view/screens/landing.dart';
import '../view/screens/login.dart';
import '../view/screens/onboarding.dart';
import '../view/screens/otp.dart';
import '../view/screens/register.dart';
import '../view/screens/settings.dart';
import '../view/screens/splash.dart';
import '../view/screens/transactions.dart';
import '../view/screens/wallet.dart';

class Routes{

  static final routes = [
    GetPage(
      name: '/splash', 
      page: () =>  SplashScreen(),
      binding: null
    ),

    GetPage(
      name: '/batch',
      page: () => Batches(),
      binding: DataBinding(),
    ),

   GetPage(
      name: '/onboarding', 
      page: () =>  OnboardingScreen(),
      binding: null
    ),
    GetPage(
      name: '/landing', 
      page: () =>  LandingScreen(),
      binding: null
    ),

    GetPage(
      name: '/login', 
      page: () =>  LoginScreen(),
      binding: null
    ),
       
    GetPage(
      name: '/register', 
      page: () =>  RegisterScreen(),
      binding: null
    ),
          
    GetPage(
      name: '/otp', 
      page: () =>  OtpPage(),
      binding: null
    ),
    GetPage(
      name: '/dashboard', 
      page: () =>  Dashboard(pageIndex: 0,),
      binding: null
    ),
    GetPage(
      name: '/home', 
      page: () =>  Home(),
      binding: null
    ),
    GetPage(
      name: '/settings', 
      page: () =>  SettingsScreen(),
      binding: null
    ),
    GetPage(
      name: '/wallet', 
      page: () =>  WalletScreen(),
      binding: null
    ), 
    GetPage(name: '/transaction', page: () => Transactions(), binding: DataBinding())

  ];
}