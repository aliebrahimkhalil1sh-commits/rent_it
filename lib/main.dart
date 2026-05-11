import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_it/features/Auth/Views/authgate.dart';
import 'package:rent_it/features/Auth/cubit/auth_cubit.dart';

void main() {
  runApp(RentIt());
}

class RentIt extends StatelessWidget {
  const RentIt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Poppins",
          splashColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    );
  }
}
