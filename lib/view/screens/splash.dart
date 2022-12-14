import 'package:dcms_app/view/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
          Navigator.pushNamed(context, '/landing');
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
              SizedBox(height: 50),
              SpinKitDoubleBounce (color: Color(0xff00A850))
              // SpinKitThreeBounce(color: Color(0xff00A850), size: 30,)
              //  SpinKitFadingCircle(color: Colors.white, size: 50)
             
            ],
          ),
        ),
      ),
    );
  }

}
