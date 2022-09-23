// ignore_for_file: prefer_const_constructors

import 'package:dcms_app/view/screens/landing.dart';
import 'package:dcms_app/view/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
          Get.off( LandingScreen());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _con.scaffoldKey,
      body: Container(
        decoration:

        BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF),  Color(0xFFFFFFFF)])
          ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon.png',
                width: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 70),
              SpinKitDualRing(
                      color: Colors.green,
                      lineWidth: 3,
                      size: 40,
                    ),
             
            ],
          ),
        ),
      ),
    );
  }

}
