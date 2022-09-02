
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dcms_app/view/screens/components/background.dart';
import 'package:dcms_app/view/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Image.asset(
              "assets/logo.png",
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              padding: EdgeInsets.only(top: 50.0, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "We Simplify",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25.0,
                      
                    ),
                  ),
                  Text(
                    " Agriculture",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),

                 
                ],
              ),
            ),

             Container(
                 width: MediaQuery.of(context).size.width,
              margin:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
               child: Text("Experience the comfort of using our amazing farm services.", style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.normal),),
             ), 
            SizedBox(height: 30,),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  // Login
                   Get.to(LoginScreen());

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 55.0,
                  width: size.width * 0.9,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient:  LinearGradient(colors: [
                        Color(0xFF00A850),
                       Color(0xFF82CB46)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Let's Get Started",
                    
                    textAlign: TextAlign.center,

                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
