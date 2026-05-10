import 'package:flutter/material.dart';

class Customsnackbar extends StatelessWidget {
  const Customsnackbar({super.key, required this.errorMsg});
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Center(child: Text(errorMsg)),
    );
  }
}
