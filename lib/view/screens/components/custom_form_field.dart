// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
        left: 20.0,
        right: 20.0,
      ),
      child: TextFormField(
        inputFormatters: inputFormatters,
        validator: validator,
        controller: controller,
        keyboardType: TextInputType.text,
        autocorrect: true,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00A850), width: 1.0),
          ),
          prefixIcon: Icon(
            Icons.person,
            size: 28.0,
            color: Color(0xFF00A850),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 19.0,
          ),
        ),
      ),
    );
  }

  
}
