import 'package:contend/pages/login/login_screeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contend/pages/splash_screen/splash_screen_controller.dart';
import 'package:contend/pages/splash_screen/splash_screen_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../core/widgets/base_stateless_widget.dart';
import 'package:contend/pages/home_page/home_page.dart';
import 'package:contend/pages/signup_screen/signup_screen.dart';

class SplashScreen extends BaseStatelessWidget<SplashScreenController,
    SplashScreenCubit, SplashScreenState> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          // TODO: Implement listener if needed
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              body: Container(
                width: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.login_bg_1.withOpacity(1),
                      AppColors.login_bg_2.withOpacity(0.6),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 160),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/cy.png",
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        'CHALLENGE YOUSELF',
                        style: TextStyle(
                          fontSize: Fonts.fontSize24,
                          color: Colors.white,
                          fontFamily: Fonts.fontNunito,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => LoginScreen()),
                          // );
                          context.push("/login");
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 130.0,
                            vertical: 17.0,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Fonts.fontSize20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => SignupScreen(),
                          //   ),
                          // );
                          context.push("/signup");
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            horizontal: 125.0,
                            vertical: 16.0,
                          ),
                        ),
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Fonts.fontSize20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  SplashScreenCubit createCubitAndAssignToController(BuildContext context) {
    SplashScreenCubit cubit = SplashScreenCubit(context);
    controller?.cubit = cubit;
    return cubit;
  }
}
