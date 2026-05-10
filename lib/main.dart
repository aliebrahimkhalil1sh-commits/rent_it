import 'package:flutter/material.dart';
import 'package:rent_it/features/Auth/Views/signupview.dart';

void main() {
  runApp(RentIt());
}

class RentIt extends StatelessWidget {
  const RentIt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins", splashColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: SignUpview(),
    );
  }
}
