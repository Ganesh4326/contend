import 'package:contend/pages/accepted_challenges_screen/accepted_challenges_screen.dart';
import 'package:contend/pages/challenge_screen/challenge_screen.dart';
import 'package:contend/pages/challenges_analytics_screen/challenges_analytics_screen.dart';
import 'package:contend/pages/create_challenge/create_challenge_screen.dart';
import 'package:contend/pages/create_order_screen/create_order_screen.dart';
import 'package:contend/pages/home_page/home_page.dart';
import 'package:contend/pages/login/login_screeen.dart';
import 'package:contend/pages/manage_friend_requests_screen/manage_friend_requests_screen.dart';
import 'package:contend/pages/manage_friends_screen/manage_friends_screen.dart';
import 'package:contend/pages/my_challenges_screen/my_challenges_screen.dart';
import 'package:contend/pages/profile_screen/profile_screen.dart';
import 'package:contend/pages/signup_screen/signup_screen.dart';
import 'package:contend/pages/splash_screen/splash_screen.dart';
import 'package:contend/pages/users_friends_screen/users_friends_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../main.dart';
import '../core/logger/log.dart';
import 'auth/AuthService.dart';
import 'authentication/authentication_cubit.dart';

final GoRouter router = GoRouter(routes: [
  // GoRoute(
  //     path: '/',
  //     builder: (context, state) {
  //       return BlocListener<AuthenticationCubit, AuthenticationState>(
  //         listener: (context, state) async {
  //           String? userId = await AuthService.getUserId();
  //
  //           if (userId != null) {
  //             logger.d('in success');
  //             context.go('/home');
  //           } else {
  //             logger.d('in error');
  //             context.go('/splash');
  //           }
  //         },
  //         child: const SizedBox(),
  //       );
  //     }),
  GoRoute(path: '/', builder: (context, state) => SplashScreen()),
  GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
  GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
  GoRoute(path: '/home', builder: (context, state) => HomePage()),
  GoRoute(
      path: '/mychallenges', builder: (context, state) => MyChallengesScreen()),
  GoRoute(
      path: '/createchallenge',
      builder: (context, state) => CreateChallengeScreen()),
  GoRoute(
      path: '/accepted',
      builder: (context, state) => AcceptedChallengesScreen()),
  GoRoute(path: '/orders', builder: (context, state) => CreateOrderScreen()),
  GoRoute(
      path: '/analytics',
      builder: (context, state) => ChallengesAnalyticsScreen()),
  GoRoute(
      path: '/requests',
      builder: (context, state) => ManageFriendRequestsScreen()),
  GoRoute(
      path: '/myfriends', builder: (context, state) => UsersFriendsScreen()),
  GoRoute(
      path: '/managefriends',
      builder: (context, state) => ManageFriendsScreen()),
  GoRoute(
      path: '/challengedetails/:challengeId',
      builder: (context, state) =>
          ChallengeScreen(challengeId: state.pathParameters['challengeId'])),
  GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
]);
