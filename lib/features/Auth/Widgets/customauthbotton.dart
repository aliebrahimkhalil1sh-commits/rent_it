import 'package:flutter/material.dart';
import 'package:rent_it/shared/custom_Text.dart';

class CustomAuthBotton extends StatelessWidget {
  const CustomAuthBotton({
    super.key,
  
    required this.text, required this.onTap,
  });
  final String text;
  final Function()? onTap ;




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white24,
            border: BoxBorder.all(color: Colors.white,),
        
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: CustomText(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
              text: text,
            ),
          ),
        ),
      ),
    );
  }
}
