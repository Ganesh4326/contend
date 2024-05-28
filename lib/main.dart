import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:contend/auth/AuthService.dart';
import 'package:contend/firebase_options.dart';
import 'package:contend/routes.dart';
import 'package:contend/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/authentication_cubit.dart';
import 'core/logger/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AndroidAlarmManager.initialize();
  await SharedPreferences.getInstance();

  String? userId = await AuthService.getUserId();
  logger.d(userId);

  runApp(MyApp(isUserAuthenticated: userId != null));
}

class MyApp extends StatelessWidget {
  final bool isUserAuthenticated;

  const MyApp({Key? key, required this.isUserAuthenticated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(context: context),
        ),
      ],
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: FToastBuilder(),
            routerConfig: router,
            theme: Themes.lightTheme,
          );
        },
      ),
    );
  }
}
