import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:contend/firebase_options.dart';
import 'package:contend/pages/challenges_analytics_screen/challenges_analytics_screen.dart';
import 'package:contend/pages/home_page/home_page.dart';
import 'package:contend/pages/login/login_screeen.dart';
import 'package:contend/pages/profile_screen/profile_screen.dart';
import 'package:contend/pages/signup_screen/signup_screen.dart';
import 'package:contend/pages/test_screen.dart';
import 'package:contend/auth/AuthService.dart';
import 'package:contend/pages/create_challenge/create_challenge_screen.dart';
import 'package:contend/pages/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/logger/log.dart';
import 'core/widgets/base_screen_widget.dart';

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
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(goRouterState: GoRouterState(), pageContext: context,),
        '/analytics': (context) => ChallengesAnalyticsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/test': (context) => ChallengesAnalyticsScreen(),
        '/createchallenge': (context) => CreateChallengeScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: isUserAuthenticated ? HomePage(goRouterState: GoRouterState(), pageContext: context,) : SplashScreen(),
    );
  }
}
