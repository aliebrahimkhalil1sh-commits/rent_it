import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/Networks/api_error.dart';
import 'package:rent_it/core/constants/app_color.dart';
import 'package:rent_it/features/Auth/Data/auth_repo.dart';
import 'package:rent_it/features/Auth/Views/loginview.dart';
import 'package:rent_it/features/Auth/Widgets/customauthbotton.dart';
import 'package:rent_it/features/Auth/cubit/auth_cubit.dart';
import 'package:rent_it/features/Auth/cubit/auth_state.dart';
import 'package:rent_it/rootView.dart';
import 'package:rent_it/shared/Cusomsnackbar.dart';
import 'package:rent_it/shared/custom_Text.dart';
import 'package:rent_it/shared/customtextform.dart';

class SignUpview extends StatefulWidget {
  SignUpview({super.key});

  @override
  State<SignUpview> createState() => _SignUpviewState();
}

class _SignUpviewState extends State<SignUpview> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void register() {
    if (_formkey.currentState!.validate()) {
      context.read<AuthCubit>().register(
        name: namecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim(),
        confirmPassword: confirmpasscontroller.text.trim(),
      );
    }
  }
  // bool isloading = false;
  // AuthRepo authRepo = AuthRepo();

  // Future<void> signup() async {
  //   if (_formkey.currentState!.validate()) {
  //     setState(() {
  //       isloading = true;
  //     });

  //     try {
  //       await authRepo.register(
  //         namecontroller.text.trim(),
  //         emailcontroller.text.trim(),
  //         passcontroller.text.trim(),
  //         confirmpasscontroller.text.trim(),
  //       );

  //       setState(() {
  //         isloading = false;
  //       });

  //       Navigator.push(context, MaterialPageRoute(builder: (c) => RootView()));
  //     } catch (e) {
  //       setState(() {
  //         isloading = false;
  //       });

  //       String errorMsg = 'unhandled error in signup';

  //       if (e is ApiError) {
  //         errorMsg = e.message;
  //       }

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Customsnackbar(errorMsg: errorMsg),
  //           padding: const EdgeInsets.all(20),
  //           backgroundColor: AppColors.primaryColor,
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Customsnackbar(
              errorMsg: 'Account created successfully. Please login.',
            ),
            padding: const EdgeInsets.all(20),
            backgroundColor: AppColors.primaryColor,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      }

      if (state is AuthFailureState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Customsnackbar(errorMsg: state.errmsg),
            padding: const EdgeInsets.all(20),
            backgroundColor: AppColors.primaryColor,
          ),
        );
      }
    },
    builder: (context, state) {
      final bool isLoading = state is AuthLoadingState;
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Gap(100),
                    CustomText(
                      color: Colors.red,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      text: 'AI_Rent Marketplace',
                    ),
                    Gap(7),
                    CustomText(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      text: 'Borrow instead of buying',
                    ),
                    Gap(5),

                    Gap(80),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(50),
                              CustomTextform(
                                hinttext: "enter your Name ? ",
                                label: Text("Name"),
                                ispassword: false,
                                controller: namecontroller,
                              ),
                              Gap(10),
                              CustomTextform(
                                hinttext: "enter your Email ? ",
                                label: Text("Email"),
                                ispassword: false,
                                controller: emailcontroller,
                              ),
                              Gap(10),
                              CustomTextform(
                                hinttext: "enter your pass ? ",
                                label: Text("Password"),
                                ispassword: true,
                                controller: passcontroller,
                              ),
                              Gap(10),
                              CustomTextform(
                                hinttext: "Confirm Password",
                                label: Text("Confirm Password"),
                                ispassword: true,
                                controller: confirmpasscontroller,
                              ),
                              Gap(17),
                              isLoading
                                  ? const CupertinoActivityIndicator(
                                      color: Colors.white,
                                    )
                                  : CustomAuthBotton(
                                      text: "Sign_Up",
                                      onTap: register,
                                    ),
                              Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 15,
                                    text: "have you an account? ",
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginView(),
                                        ),
                                      );
                                    },
                                    child: CustomText(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16,
                                      text: "Log in",
                                    ),
                                  ),
                                ],
                              ),
                              Gap(15),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RootView(),
                                    ),
                                  );
                                },
                                child: CustomText(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 19,
                                  text: "Enter as Guest??",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
