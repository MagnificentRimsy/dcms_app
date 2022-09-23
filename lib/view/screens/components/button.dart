import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  var onPressed;

  
  String caption;
  dynamic textColor;
  dynamic backgroundColor;
  dynamic primaryColor;
  dynamic sideColor;
  double borderRadius ;


  ButtonComponent(
      {Key? key,
      required this.onPressed,
      required this.caption,
      required this.textColor,
      required this.backgroundColor,
      this.borderRadius = 0
      
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 40),
      alignment: Alignment.center,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            primary: primaryColor,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2), 
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),

          ),
          onPressed: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    caption,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
