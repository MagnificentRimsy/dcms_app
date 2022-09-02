// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dcms_app/data/models/data/otp.dart';
import 'package:dcms_app/utils/custom_snackbar.dart';
import 'package:dcms_app/view/screens/components/preloader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/TwoFactorController.dart';
import '../../controller/otp_controller.dart';

class TwoFactorAuth extends StatefulWidget {
  TwoFactorAuth({Key? key}) : super(key: key);
  @override
  _TwoFactorAuthState createState() => _TwoFactorAuthState();
}

class _TwoFactorAuthState extends State<TwoFactorAuth> {
  var data = Get.arguments;

  String text = '';

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
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.green,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
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
            GetBuilder<TwoFactorController>(builder: (twoFactorController) {
              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  'Enter 6 digits verification code sent to your number',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500))),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 500),
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

                    twoFactorController.isLoading == true? SmallLoader():
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: RaisedButton(
                        onPressed: () {
                          print('Otp ${text}');

                          _validateOtp(twoFactorController);
                        },
                        color: Colors.green,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Verify and Proceed',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: RichText(
                        text: TextSpan(
                            text: "Don't receive the OTP?",
                            style:TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: " RESEND OTP",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //Resend Otp
                                    })
                            ]),
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
            })
          ],
        ),
      ),
    );
  }

  void _validateOtp(TwoFactorController controller) async {
    dynamic prefs = await SharedPreferences.getInstance();

    String _userName = data;
    String _otp = text.trim();

    print(_userName);
    ValidateData validateDatadBody =
        ValidateData(userName: _userName, otp: _otp);
    controller.validateTwoFactor(validateDatadBody).then((status) async {
      if (status.isSuccess) {
        await prefs.remove('username');

        showCustomSnackBar(status.message);
      }
      showCustomSnackBar(status.message);
    });
  }
}




// import 'package:animated_widgets/widgets/rotation_animated.dart';
// import 'package:animated_widgets/widgets/shake_animated_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class VerfiyMfa extends StatefulWidget {
//   const VerfiyMfa();

//   @override
//   VerfiyMfaState createState() => VerfiyMfaState();
// }

// class VerfiyMfaState extends State<VerfiyMfa> {
//   String code;
//   bool loaded;
//   bool shake;
//   bool valid;
//   final TextEditingController _controller = TextEditingController();
//   final FocusNode _textNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     code = '';
//     loaded = true;
//     shake = false;
//     valid = true;
//   }

//   void onCodeInput(String value) {
//     setState(() {
//       code = value;
//     });
//   }

//   Future<void> verifyMfaAndNext() async {
//     setState(() {
//       loaded = false;
//     });
//     const bool result = false; //backend call
//     setState(() {
//       loaded = true;
//       valid = result;
//     });

//     if (valid) {
//       // do next
//     } else {
//       setState(() {
//         shake = true;
//       });
//       await Future<String>.delayed(
//           const Duration(milliseconds: 300), () => '1');
//       setState(() {
//         shake = false;
//       });
//     }
//   }

//   List<Widget> getField() {
//     final List<Widget> result = <Widget>[];
//     for (int i = 1; i <= 6; i++) {
//       result.add(
//         ShakeAnimatedWidget(
//           enabled: shake,
//           duration: const Duration(
//             milliseconds: 100,
//           ),
//           shakeAngle: Rotation.deg(
//             z: 20,
//           ),
//           curve: Curves.linear,
//           child: Column(
//             children: <Widget>[
//               if (code.length >= i)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15.0,
//                   ),
//                   child: Text(
//                     code[i - 1],
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10.0,
//                 ),
//                 child: Container(
//                   height: 5.0,
//                   width: 30.0,
//                   color: shake ? Colors.red : Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//           SystemChannels.textInput.invokeMethod<String>('TextInput.hide');
//         },
//         child: SingleChildScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 80),
//                 child: Text(
//                   'Verify your phone',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 38,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 60,
//               ),
//               Text(
//                 'Please enter the 6 digit pin.',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               if (!valid)
//                 Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 20,
//                       ),
//                       child: Text(
//                         'Whoops!',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               SizedBox(
//                 height: valid ? 68 : 10,
//               ),
//               if (!valid)
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 20,
//                   ),
//                   child: Text(
//                     'It looks like you entered the wrong pin. Please try again.',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 90,
//                 width: 300,
//                 // color: Colors.amber,
//                 child: Stack(
//                   children: <Widget>[
//                     Opacity(
//                       opacity: 1.0,
//                       child: TextFormField(
//                         controller: _controller,
//                         focusNode: _textNode,
//                         keyboardType: TextInputType.number,
//                         onChanged: onCodeInput,
//                         maxLength: 6,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 40,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: getField(),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               CupertinoButton(
//                 onPressed: verifyMfaAndNext,
//                 color: Colors.grey,
//                 child: Text(
//                   'Verify',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

   