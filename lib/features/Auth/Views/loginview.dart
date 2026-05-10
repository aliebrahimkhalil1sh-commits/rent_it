import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/Networks/api_error.dart';
import 'package:rent_it/core/constants/app_color.dart';
import 'package:rent_it/features/Auth/Data/auth_repo.dart';
import 'package:rent_it/features/Auth/Views/signupview.dart';
import 'package:rent_it/features/Auth/Widgets/customauthbotton.dart';
import 'package:rent_it/rootView.dart';
import 'package:rent_it/shared/Cusomsnackbar.dart';
import 'package:rent_it/shared/custom_Text.dart';
import 'package:rent_it/shared/customtextform.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isloading = false;

  AuthRepo authRepo = AuthRepo();

  Future<void> login() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });

      try {
        final user = await authRepo.login(
          emailcontroller.text.trim(),
          passwordcontroller.text.trim(),
        );

        if (user != null) {
          setState(() {
            isloading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => RootView()),
          );
        }
      } catch (e) {
        setState(() {
          isloading = false;
        });

        String errorMsg = 'unhandled error in login';

        if (e is ApiError) {
          errorMsg = e.message;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Customsnackbar(errorMsg: errorMsg),
            padding: EdgeInsets.all(20),
            backgroundColor: AppColors.primaryColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 235, 233),
        body: Center(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const Gap(80),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Gap(50),
                          CustomTextform(
                            hinttext: "Email Address",
                            ispassword: false,
                            label: const Text("Email"),
                            controller: emailcontroller,
                          ),
                          const Gap(20),
                          CustomTextform(
                            hinttext: "Password",
                            ispassword: true,
                            label: const Text("Password"),
                            controller: passwordcontroller,
                          ),
                          const Gap(35),
                                                    isloading
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                          :CustomAuthBotton(text: "Log_In", onTap: login),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 15,
                                text: "Don’t have an account? ",
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpview(),
                                    ),
                                  );
                                },
                                child: CustomText(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 16,
                                  text: "Sign Up",
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
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
  }
}
