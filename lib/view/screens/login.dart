// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:dcms_app/controller/login_controller.dart';
import 'package:dcms_app/data/models/data/sign_in.dart';
import 'package:dcms_app/view/screens/add_farmer.dart';
import 'package:dcms_app/view/screens/batches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/custom_snackbar.dart';
import 'components/preloader.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView(
      children: [
        GetBuilder<LoginController>(builder: (loginController) {
          return loginController.isLoading == true
              ? Preloader()
              : Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 30.0, left: 20),
                        child: Image.asset('assets/logo.png',
                            width: 200, height: 200),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Welcome Back',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Enter your DCMS username and password',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          controller: loginController.userNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              size: 28.0,
                              color: theme.primaryColor,
                            ),
                            hintText: 'username',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ),
                     
                     
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          autocorrect: true,
                          obscureText: !_passwordVisible,
                          controller: loginController.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please a Enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: theme.primaryColor, width: 1.0),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              size: 28.0,
                              color: theme.primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),

                            // IconButton(
                            //   icon: Icon(
                            //     Icons.remove_red_eye,
                            //     size: 28.0,
                            //     color: theme.primaryColor,
                            //   ),
                            // ),
                            hintText: 'password',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: ButtonTheme(
                          minWidth: 320.0,
                          height: 50.0,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            color: theme.primaryColor,
                            onPressed: () {
                    

                              if (_formKey.currentState!.validate()) {
                                login(loginController);
                              }
                            },
                            child: const Text(
                              'Sign in',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.pushNamed(context, '/register');
                                Get.to(()=> AddProfileDetails());
                              //  Get.to(()=> Batches());
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16.0.sp,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ],
    ));
  }

  void login(LoginController controller) async {
    String _userName = controller.userNameController.text.trim();
    String _password = controller.passwordController.text.trim();

    SignIn signInBody = SignIn(
      userName: _userName,
      password: _password,
    );
    await controller.loginAccount(context, signInBody);
  }
}
