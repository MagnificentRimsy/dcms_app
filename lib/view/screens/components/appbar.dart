import 'package:flutter/material.dart';

class AppHeaderTop extends StatelessWidget {
  String caption;
   AppHeaderTop({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Text(
                      caption,
                      style: TextStyle(fontSize: 21.0),
                    ),
                    onTap: () {},
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    child: ClipRRect(
                      child: Image.asset('assets/user.jpg'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ],
              ),
            );
  }
}