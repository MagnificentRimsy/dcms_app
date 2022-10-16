// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors

import 'package:dcms_app/view/screens/components/button.dart';
import 'package:dcms_app/view/screens/login.dart';
import 'package:dcms_app/view/screens/test_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: homePage(),
    );
  }

  Widget homePage() {
    return Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(191, 36, 39, 39),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/bg_green.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100.0, bottom: 250),
              child: Center(child: Image.asset('assets/icon_w.png')),
            ),
            Container(
              padding: EdgeInsets.only(top: 50.0, left: 30),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "We Simplify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      
                    ),
                  ),
                  Text(
                    " Agriculture",
                    style: TextStyle(
                        color: Colors.white,
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
                          color: Colors.white,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.normal),),
             ),
         
           
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: ButtonComponent(
                              onPressed: () {
                                 Get.to(LoginScreen());

                               
                              },
                              caption: "Login",
                              textColor: Colors.white,
                              backgroundColor: Colors.green,
                            )
                    
                    //  FlatButton(
                    //   shape: new RoundedRectangleBorder(
                    //       borderRadius: new BorderRadius.circular(5.0)),
                    //   color: Colors.green,
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '/login');
                    //   },
                    //   child: new Container(
                    //     padding: const EdgeInsets.symmetric(
                    //       vertical: 20.0,
                    //       horizontal: 20.0,
                    //     ),
                    //     child: new Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         new Expanded(
                    //           child: Text(
                    //             "LOGIN",
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //                 color: Color(0xff00A850),
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 16),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
