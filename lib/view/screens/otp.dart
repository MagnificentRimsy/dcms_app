// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dcms_app/data/models/data/otp.dart';
import 'package:dcms_app/utils/custom_snackbar.dart';
import 'package:dcms_app/view/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/otp_controller.dart';

class OtpPage extends StatefulWidget {
   OtpPage({Key? key}) : super(key: key);
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  String text = '';
    var userNameData = Get.arguments;

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Center(child: Text(text[position], style: TextStyle(color: Colors.black),)),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
            Scaffold(
              backgroundColor: Colors.white,
              // key: loginStore.otpScaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.green.withAlpha(20),
                    ),
                    child: Icon(Icons.arrow_back_ios, color: Colors.green, size: 16,),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    
                  }
                  
                  // => Navigator.of(context).pop(),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                brightness: Brightness.light,
              ),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[  
                    GetBuilder<OtpController>(builder: (otpController) {
                        return Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Text('Enter 6 digits verification code sent to your number', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500))
                                    ),
                                    Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 500
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          otpNumberWidget(0),
                                          otpNumberWidget(1),
                                          otpNumberWidget(2),
                                          otpNumberWidget(3),
                                          otpNumberWidget(4),
                                          otpNumberWidget(5),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                constraints: const BoxConstraints(
                                    maxWidth: 500
                                ),
                                child: RaisedButton(
                                  onPressed: () {
                                      print('Otp ${text}');

                                      _validateOtp(otpController);
                                  },
                                  color: Colors.green,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(14))
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Confirm', style: TextStyle(color: Colors.white),),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                            color: Colors.green,
                                          ),
                                          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              NumericKeyboard(
                                onKeyboardTap: _onKeyboardTap,
                                textColor: Colors.green,
                                rightIcon: Icon(
                                  Icons.backspace,
                                  color: Colors.green,
                                ),
                                rightButtonFn: () {
                                  setState(() {
                    
                                    text = text.substring(0, text.length - 1);
                                  });
                                },
                              )
                            ],
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            );
      }

      void _validateOtp (OtpController controller)async {

        String _userName = userNameData;
        String _otp = text.trim();

        print('Otp Username $_userName}');

        print(_userName);
        ValidateData validateDatadBody = ValidateData(userName: _userName, otp: _otp);
        controller.validateOtp(validateDatadBody).then((status) async {
          if(status.isSuccess){
          //  await prefs.remove('username');

            showCustomSnackBar(status.message);
          }
            showCustomSnackBar(status.message);

        });

      }
}
   