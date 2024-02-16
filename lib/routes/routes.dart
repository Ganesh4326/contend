//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
//
// final GoRouter router = GoRouter(routes: [
//   GoRoute(
//       path: '/',
//       builder: (context, state) {
//         return BlocListener<>(
//           listener: (context, state) {
//             if (state.authenticationStatus == BooleanStatus.success) {
//               context.push('/home');
//             } else if (state.authenticationStatus == BooleanStatus.error) {
//               context.push('/welcomeScreen');
//             } else {
//               context.push('/welcome');
//             }
//           },
//           child: const SizedBox(),
//         );
//       }),
//   GoRoute(
//       path: '/welcome',
//       builder: (context, state) => UsersHomeScreen(
//             pageContext: context,
//             goRouterState: state,
//           )),
//   GoRoute(
//       path: '/trackers/exercises/:exerciseId',
//       builder: (context, state) => TrackerExerciseDetailsScreen(
//             pageContext: context,
//             goRouterState: state,
//             exerciseId: state.pathParameters['exerciseId']!,
//           )),
//   GoRoute(
//       path: '/welcomeScreen',
//       builder: (context, state) => OnboardingWelcomeScreen()),
//   GoRoute(path: "/home", builder: (context, state) => TrackerMainScreen()),
//   GoRoute(
//       path: '/newsession/:sessionId',
//       builder: (context, state) => SessionsNewSessionEmptySessionScreen(
//           pageContext: context,
//           goRouterState: state,
//           sessionId: state.pathParameters['sessionId'])),
//   GoRoute(
//       path: '/newsession/template:sessionId',
//       builder: (context, state) => SessionsNewSessionWorkoutFromTemplateScreen(
//           pageContext: context,
//           goRouterState: state,
//           sessionId: state.pathParameters['sessionId'])),
//   GoRoute(
//       path: '/session/details/:sessionId',
//       builder: (context, state) => SessionsSessionDetailsScreen(
//           pageContext: context,
//           goRouterState: state,
//           gymSessionId: state.pathParameters['sessionId']!)),
//   GoRoute(
//       path: '/addexercise',
//       builder: (context, state) => TrackerAddExerciseScreen(
//             pageContext: context,
//             goRouterState: state,
//           )),
//   GoRoute(
//       path: '/congratulations/:gymSessionId',
//       builder: (context, state) => TrackerNewSessionCongratulationsScreen(
//             pageContext: context,
//             goRouterState: state,
//             gymSessionId: state.pathParameters['gymSessionId'],
//           )),
//   GoRoute(
//       path: '/reminders/all',
//       builder: (context, state) => UsersRemindersAllRemindersScreen(
//             pageContext: context,
//             goRouterState: state,
//           )),
//   GoRoute(
//       path: '/template/details/:workoutTemplateId',
//       builder: (context, state) => TemplatesTemplateDetailsScreen(
//           pageContext: context,
//           goRouterState: state,
//           workoutTemplateId: state.pathParameters['workoutTemplateId']!)),
// ]);
