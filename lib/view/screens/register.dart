// ignore_for_file: prefer_const_constructors

import 'package:dcms_app/controller/register_controller.dart';
import 'package:dcms_app/view/screens/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../data/models/data/register.dart';
import '../../utils/custom_snackbar.dart';
import 'components/custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key,  this.hintText,
    this.inputFormatters,
    this.validator,}) : super(key: key);

    final String? hintText;
    final List<TextInputFormatter>? inputFormatters;
    final String? Function(String?)? validator;


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  List<String> userTypes = [
    'Farmer',
    'Agent',
  ];
  int userTypesCurrentSelected = 0;

 // int currentSelected = 0;
  RegistrationController registerController = RegistrationController();
  final _formKey = GlobalKey<FormState>();

  String choice = "";

  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneNoFocus = FocusNode();

  bool _passwordVisible = true;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView(
      children: [
        GetBuilder<RegistrationController>(builder: (registrationController) {
          return registrationController.isLoading == true
              ? Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: SpinKitDualRing(
                      color: Colors.green,
                      lineWidth: 2,
                    ),
                  ),
                )
              :  Form(
                key: _formKey,

                
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 5.0, left: 20),
                        child: Image.asset('assets/icon.png',
                            width: 200, height: 100),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Let\' Get started',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child:  Text(
                          'Enter your details to create an Account with us.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0.sp,
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
                        child: TextFormField(
                         
                          controller: registrationController.userNameController,
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          focusNode: _userNameFocus,
                          validator: (String? value){
                              if(value!.isEmpty)
                              {
                                return 'Please Enter Name';
                              }
                              return null;
                            },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: theme.primaryColor, width: 1.0),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 28.0,
                              color: theme.primaryColor,
                            ),
                            hintText: 'Username',
                            
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
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          controller: registrationController.emailController,
                          focusNode: _emailFocus,
                          validator: (String? value){
                              if(value!.isEmpty)
                              {
                                return 'Please a Enter';
                              }
                              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                return 'Please a valid Email';
                              }
                              return null;
                            },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: theme.primaryColor, width: 1.0),
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              size: 28.0,
                              color: theme.primaryColor,
                            ),
                            hintText: 'example@email.com',
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
                          controller: registrationController.passwordController,
                          focusNode: _passwordFocus,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
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
                            hintText: ' Password',
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
                            keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          autocorrect: true,
                          controller: registrationController.phoneNoController,
                          focusNode: _phoneNoFocus,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: theme.primaryColor, width: 1.0),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 28.0,
                              color: theme.primaryColor,
                            ),
                            hintText: 'Phone',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
              
                      Padding(
                        padding: EdgeInsets.only(left: 10.h, right: 10.h),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: GridView.builder(
                            itemCount: userTypes.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    userTypesCurrentSelected = index;
                                  });
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: userTypesCurrentSelected == index
                                            ? Colors.green
                                            : Colors.white),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        userTypesCurrentSelected == index
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(
                                                  Icons.check_box,
                                                  color: Colors.white,
                                                  size: 16.h,
                                                ),
                                              )
                                            : Container(),
                                        Text(
                                          '${userTypes[index]}',
                                          style: TextStyle(
                                            color:
                                                userTypesCurrentSelected == index
                                                    ? Colors.white
                                                    : Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 4.0),
                          ),
                        ),
                      ),
              
                
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60.0,
                          child: ElevatedButton(
                            onPressed: () {
                                 _register(registrationController);                        
                             },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.normal),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'I have an account?',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                'Sign In',
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

  void _register(RegistrationController controller) async {
    String _userName = controller.userNameController.text.trim();
    String _email = controller.emailController.text.trim();
    String _password = controller.passwordController.text.trim();
    String _phoneNo = controller.phoneNoController.text.trim();

    SignUp signUpBody = SignUp(
        userName: _userName,
        email: _email,
        password: _password,
        phoneNo: _phoneNo,
        userType: userTypesCurrentSelected,
        pcDomainName: '',
        pcIpAddress: '',
        pcName: '',
        pcUserName: '');
    controller.registration(signUpBody, context).then((status) async {
      if (status.isSuccess) {
        showCustomSnackBar(status.message);
      } else {
        showCustomSnackBar(status.message);
      }
    });

  }

  
}


