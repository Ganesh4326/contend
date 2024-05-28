import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(BuildContext context) : super(SplashScreenInitial()) {
    checkAuth(context);
  }

  checkAuth(BuildContext context) async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.go("/home");
    }
  }
}
