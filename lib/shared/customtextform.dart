import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextform extends StatefulWidget {
  const CustomTextform({
    super.key,
    required this.hinttext,

    required this.label,
    required this.ispassword,
    required this.controller,
  });
  final String hinttext;
  final Widget label;
  final bool ispassword;
  final TextEditingController controller;

  @override
  State<CustomTextform> createState() => _CustomTextformState();
}

class _CustomTextformState extends State<CustomTextform> {
  late bool _obscuretext;
  @override
  void initState() {
    _obscuretext = widget.ispassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "please fill the ${widget.hinttext}";
          }

          return null;
        },
        obscureText: _obscuretext,

        decoration: InputDecoration(
          suffixIcon: widget.ispassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscuretext = !_obscuretext;
                    });
                  },
                  child: Icon(CupertinoIcons.eye, color: Colors.black),
                )
              : null,
          fillColor: Colors.white,
          filled: true,
          label: widget.label,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),

          hintText: widget.hinttext,
          
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
