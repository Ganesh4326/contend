import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:contend/pages/signup_screen/signup_screen_controller.dart';
import 'package:contend/pages/signup_screen/signup_screen_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../firebase_options.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/fonts.dart';
import '../../auth/AuthService.dart';
import '../../core/widgets/base_stateless_widget.dart';
import '../../models/user.dart';
import '../../services/fire_store.dart';
import '../../services/user_provider.dart';

class SignupScreen extends BaseStatelessWidget<SignupController,
    SignupScreenCubit, SignupScreenState> {
  SignupScreen({super.key});

  final FireStoreService fireStoreService = FireStoreService();

  final TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Future<void> registerUser() async {
    print("In register USER");
    try {
      Users newUser = Users(
        userName: usernameController.text,
        userId: emailController.text,
        password: passwordController.text,
        noOfChallengesCreated: 0,
        noOfChallengesAccepted: 0,
        noOfChallengesCompleted: 0,
        coins: 0,
        about: '', emailId: emailController.text,
      );

      String? userId = await fireStoreService.createUser(newUser);

      await AuthService.saveUserId(userId!, usernameController.text);
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  Future<void> addAcceptedChallenge(
      String userId, String challengeId, int noOfDays) async {
    await fireStoreService.addAcceptedChallenge(userId, challengeId, noOfDays);
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      duration: Duration(seconds: 2),
    );

    // Show the SnackBar in the context of the Scaffold
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupScreenCubit>(
      create: (create) => createCubitAndAssignToController(context),
      child: BlocConsumer<SignupScreenCubit, SignupScreenState>(
        listener: (context, state) {},
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
                      gradient: LinearGradient(colors: [
                        AppColors.login_bg_1.withOpacity(0.7),
                        AppColors.login_bg_2.withOpacity(0.2)
                      ], begin: Alignment.bottomLeft, end: Alignment.topRight),
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
                                    TyperAnimatedText('Create account',
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        )),
                                    TyperAnimatedText('To get started',
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
                          padding: EdgeInsets.only(top: 40),
                          child: TextField(
                            controller: usernameController,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                labelText: "User name",
                                fillColor: Colors.white),
                            style: TextStyle(
                                fontSize: Fonts.fontSize18,
                                color: AppColors.bmiTracker),
                          ),
                        ),
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
                                  text: 'have an account? Click here',
                                  style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: Fonts.fontSize14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/login');
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
                              registerUser();
                              Navigator.pushNamed(context, '/home');
                              showSnackBar(context, 'Signup successful!');
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80.0, vertical: 10.0),
                              // Set padding
                              primary: AppColors
                                  .bmiTracker, // Set background color to white
                            ),
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Fonts.fontSize20),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text("Or continue with"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/facebook_logo.png',
                                width: 60,
                                height: 60,
                              ),
                              Image.asset(
                                'images/google_logo.png',
                                width: 45,
                                height: 45,
                              ),
                              Image.asset(
                                'images/insta_logo.png',
                                width: 70,
                                height: 70,
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              addAcceptedChallenge('sgganesh240@gmail.com',
                                  '003dbfa4-108d-437c-83a3-d08f5506fbca', 10);
                            },
                            child: Text('ADD'))
                      ],
                    ),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }

  @override
  SignupScreenCubit createCubitAndAssignToController(BuildContext context) {
    SignupScreenCubit cubit = SignupScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
