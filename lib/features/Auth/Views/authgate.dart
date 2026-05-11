import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_it/features/Auth/Views/loginview.dart';
import 'package:rent_it/features/Auth/cubit/auth_cubit.dart';
import 'package:rent_it/features/Auth/cubit/auth_state.dart';
import 'package:rent_it/rootView.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticatedState) {
          return const RootView();
        }

        if (state is AuthUnauthenticatedState) {
          return const LoginView();
        }

        return const Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }
}