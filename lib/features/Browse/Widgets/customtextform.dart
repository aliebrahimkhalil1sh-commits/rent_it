import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_it/shared/custom_Text.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key,  this.Controller, required this.hinttext, required this.icon});
  final String hinttext;
  final IconData icon;
  final TextEditingController? Controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controller,
      decoration: InputDecoration(
        icon: Icon(icon, size: 30),
        iconColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),

        hint: Center(
          child: CustomText(
            fontWeight: FontWeight.w200,
            color: Colors.blueGrey,
            fontSize: 19,
            text: hinttext,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
//" Searsh by Title Or desc "