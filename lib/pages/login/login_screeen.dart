import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:contend/core/widgets/base_screen_widget.dart';
import 'package:contend/pages/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/edge_insets.dart';
import '../../../themes/app_colors.dart';
import '../../auth/AuthService.dart';
import '../../core/logger/log.dart';
import '../../core/widgets/base_stateless_widget.dart';
import '../../services/fire_store.dart';
import '../../themes/fonts.dart';
import 'login_screen_controller.dart';
import 'login_screen_cubit.dart';

class LoginScreen extends BaseStatelessWidget<LoginScreenController,
    LoginScreenCubit, LoginScreenState> {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FireStoreService fireStoreService = FireStoreService();
  String errorMessage = '';

  bool errMessage = false;

  Future<void> checkLogin(BuildContext context) async {
    String? loginSuccess = await fireStoreService.loginUser(
        emailController.text, passwordController.text);
    if (loginSuccess != '') {
      logger.d(emailController.text);
      print('Navigate to home screen');
      // Navigator.pushNamed(context, '/home');
      context.push("/home");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      // );
      await AuthService.saveUserId(loginSuccess,
          await fireStoreService.getUserName(emailController.text));
    } else {
      errorMessage = 'Incorrect user ID or password. Please try again.';
      this.getCubit(context).setErrorMessage();
      errMessage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginScreenCubit>(
        create: (create) => createCubitAndAssignToController(context),
        child: BlocConsumer<LoginScreenCubit, LoginScreenState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                body: SingleChildScrollView(
                    child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          // Adjust the opacity (0.0 to 1.0)
                          BlendMode.dstATop,
                        ),
                        child: Image.asset(
                          'images/contend-logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 800,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              AppColors.login_bg_1.withOpacity(0.7),
                              AppColors.login_bg_2.withOpacity(0.2)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 100, left: 30),
                              child: Row(
                                children: [
                                  AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText('Welcome back',
                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          )),
                                      TyperAnimatedText('You have been missed',
                                          textStyle: const TextStyle(
                                              color: AppColors.primary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                    onTap: () {
                                      print("I am executing");
                                    },
                                  ),
                                ],
                              )),
                          Container(
                            width: 290,
                            margin: EdgeInsets.only(top: 40),
                            child: TextField(
                              controller: emailController,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                labelText: "Email",
                              ),
                              style: TextStyle(
                                  fontSize: Fonts.fontSize18,
                                  color: AppColors.bmiTracker),
                            ),
                          ),
                          Container(
                            width: 290,
                            margin: EdgeInsets.only(top: 40),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                labelText: "Password",
                              ),
                              style: TextStyle(
                                  fontSize: Fonts.fontSize18,
                                  color: AppColors.bmiTracker),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 30, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "don't have an account? Click here",
                                    style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontSize: Fonts.fontSize14),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push('/signup');
                                      },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                              onPressed: () {
                                checkLogin(context);
                                // Navigator.pushNamed(context, '/home');
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 80.0, vertical: 10.0),
                                backgroundColor: AppColors
                                    .bmiTracker, // Set background color to white
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Fonts.fontSize20),
                              ),
                            ),
                          ),
                          if (errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          // state.isError!
                          //     ? Container(
                          //         margin: EdgeInsets.only(top: 20),
                          //         child: Text("Or continue with"),
                          //       )
                          //     : Container(),
                          // Container(
                          //   margin:
                          //       EdgeInsets.only(top: 20, left: 40, right: 40),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       Image.asset(
                          //         'images/facebook_logo.png',
                          //         width: 60,
                          //         height: 60,
                          //       ),
                          //       Image.asset(
                          //         'images/google_logo.png',
                          //         width: 45,
                          //         height: 45,
                          //       ),
                          //       Image.asset(
                          //         'images/insta_logo.png',
                          //         width: 70,
                          //         height: 70,
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            );
          },
        ));
  }

  @override
  LoginScreenCubit createCubitAndAssignToController(BuildContext context) {
    LoginScreenCubit cubit = LoginScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
