import 'package:flutter/material.dart';

Widget customCardCategory(String title, String spots, icon, String img) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,

      borderRadius: BorderRadius.circular(10.0),
      image: DecorationImage(
        image: AssetImage('assets/images/$img.jpg'),
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
        fit: BoxFit.cover,

      )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Column(children: [
          Text('Helloooo')
        ],)
     
      ),
    ),
  );
}
