import 'package:dcms_app/util/customcard.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Container(
                      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/design.png'),
                        fit: BoxFit.fill),
                  )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child:Row(children: [
                          Container(child: Text('Total Wallet Balance'),
                          ),
                          SizedBox(width: 10.0,),
                            Container(child: Text('Total Wallet Balance'),
                          ),
                      ],)
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
