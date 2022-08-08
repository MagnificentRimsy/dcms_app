// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool _isLoading = false;
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: _isLoading == true
            ? const SpinKitDoubleBounce(color: const Color(0xff00A850))
            : ListView(
                children: [
                  Column(
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
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold
                          ),
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
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
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
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          controller: email,
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
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          obscureText: true,
                          controller: password,
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
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              size: 28.0,
                              color: theme.primaryColor,
                            ),
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
                              setState(() {
                                _isLoading = true;
                              });
                              // _signIn(email.text, password.text, context);
                              Navigator.pushNamed(context, '/home');

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
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ));
  }
}
