import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Preloader extends StatelessWidget {
  const Preloader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SpinKitDualRing(
            color: Colors.green,
            lineWidth: 2,
          ),
        ),
      );
  }
}


class SmallLoader extends StatelessWidget {
  const SmallLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
          size: 40,
        ),
      );
  }
}