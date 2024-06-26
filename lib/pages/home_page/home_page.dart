import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/auth/AuthService.dart';
import 'package:contend/core/widgets/base_screen_widget.dart';
import 'package:contend/core/widgets/base_stateless_widget.dart';
import 'package:contend/pages/accepted_challenges_screen/accepted_challenges_screen.dart';
import 'package:contend/pages/challenge_screen/challenge_screen.dart';
import 'package:contend/pages/create_order_screen/create_order_screen.dart';
import 'package:contend/pages/manage_friend_requests_screen/manage_friend_requests_screen.dart';
import 'package:contend/pages/manage_friends_screen/manage_friends_screen.dart';
import 'package:contend/pages/users_friends_screen/users_friends_screen_cubit.dart';
import 'package:contend/widgets/checkbox_wid/checkbox_widget.dart';
import 'package:contend/pages/home_page/home_page_controller.dart';
import 'package:contend/pages/home_page/home_page_cubit.dart';
import 'package:contend/pages/my_challenges_screen/my_challenges_screen.dart';
import 'package:contend/pages/splash_screen/splash_screen.dart';
import 'package:contend/services/challenge_duration_manager.dart';
import 'package:contend/services/fire_store.dart';
import 'package:contend/widgets/users_user_requests_friends/users_user_requests_friends.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/logger/log.dart';
import '../../models/challenge.dart';
import '../../models/user.dart';
import '../../styles/edge_insets.dart';
import '../../../themes/borders.dart';

import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../challenges_analytics_screen/challenges_analytics_screen.dart';
import '../create_challenge/create_challenge_screen.dart';
import '../login/login_screeen.dart';
import '../profile_screen/profile_screen.dart';
import '../signup_screen/signup_screen.dart';
import '../test_screen.dart';
import '../users_friends_screen/users_friends_screen.dart';

class HomePage extends BaseStatelessWidget<HomePageController, HomePageCubit,
    HomePageState> {
  HomePage({super.key});

  //firestore
  final FireStoreService fireStoreService = FireStoreService();

  final ChallengeDurationManager challengeDurationManager =
      ChallengeDurationManager();

  TextEditingController searchText = TextEditingController();

  //text controller
  final TextEditingController textEditingController = TextEditingController();

  bool isChecked = false;

  void setChecked(bool value) {
    isChecked = value;
  }

  late Timer _timer;

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    // super.dispose();
  }

  void startTimer() {
    // Set up a timer to call the fetchUserChallenges function every 1 hour
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      // logger.d("YES");
    });
  }

  void joinChallenge() async {
    String userId = 'user123'; // replace with actual user ID
    String challengeId =
        '8806028b-7438-4518-b77a-b2b968ca9861'; // replace with actual challenge ID
    await fireStoreService.createChallengeJoin(userId, challengeId);
    print("JOINED:");
  }

  // Example call to getChallengesByUserId
  void fetchUserChallenges() async {
    String userId = 'sgganesh@gmail.com';
    List<Challenge> userChallenges =
        await fireStoreService.getChallengesByUserId(userId);
    userChallenges.forEach((challenge) {
      print("Challenge Title: ${challenge.challengeTitle}");
    });
  }

  void openWhatsapp() async {
    String url = "whatsapp://send?+9347976049";
    launchUrl(Uri.parse(url));
  }

  Future<void> logout() async {
    await AuthService.removeUserId();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
        create: (create) => createCubitAndAssignToController(context),
        child: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return BlocProvider<HomePageCubit>(
                create: (create) => createCubitAndAssignToController(context),
                child: BlocConsumer<HomePageCubit, HomePageState>(
                  listener: (context, state) {
                    if (onStateChanged != null) {
                      onStateChanged!(state);
                    }
                  },
                  builder: (context, state) {
                    // this.getCubit(context).getUserName();

                    return MaterialApp(
                        home: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Builder(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Container(
                                    padding: EdgeInsets.only(
                                        top: 20, right: 10, left: 10),
                                    height: 90,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 30),
                                              child: Image.asset(
                                                "images/contend-logo.png",
                                                width: 40,
                                                height: 40,
                                              ),
                                            ),
                                            Container(
                                                margin: edge_insets_r_4,
                                                child: Text("${state.coins}")),
                                            Image.asset(
                                              "images/coin.png",
                                              width: 20,
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: InkWell(
                                              onTap: () {
                                                context.push("/notifications");
                                              },
                                              child: Icon(Icons.notifications)),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    PopupMenuButton<String>(
                                      onSelected: (String result) {
                                        // Handle menu item selection here
                                        print(result);
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[
                                        PopupMenuItem<String>(
                                          value: 'option1',
                                          child: InkWell(
                                              onTap: () {
                                                context.push('/mychallenges');
                                              },
                                              child: Text("My challenges")),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'option3',
                                          child: InkWell(
                                              onTap: () {
                                                context.push('/accepted');
                                              },
                                              child:
                                                  Text("Accepted challenges")),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'option3',
                                          child: InkWell(
                                              onTap: () {
                                                context.push('/orders');
                                              },
                                              child: Text("Orders")),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'option3',
                                          child: InkWell(
                                              onTap: () {
                                                context.push('/managefriends');
                                              },
                                              child: Text("Manage friends")),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'option3',
                                          child: InkWell(
                                              onTap: () {
                                                context.push('/requests');
                                              },
                                              child: Text("Friend requests")),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'option3',
                                          child: InkWell(
                                              onTap: () {
                                                context.push('/myfriends');
                                              },
                                              child: Text("My Friends")),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'option3',
                                          child: InkWell(
                                              onTap: () {
                                                context.push('/help');
                                              },
                                              child: Text("Help")),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                floatingActionButton: FloatingActionButton(
                                  onPressed: () {
                                    context.push('/createchallenge');
                                  },
                                  child: const Icon(Icons.add),
                                ),
                                body: SingleChildScrollView(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 25, right: 25),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: edge_insets_t_40,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'welcome, ',
                                                  style: TextStyle(
                                                      fontSize:
                                                          Fonts.fontSize20,
                                                      fontFamily:
                                                          Fonts.fontNunito,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                                Text(
                                                  "${state.userName}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          Fonts.fontSize24,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color:
                                                          AppColors.bmiTracker),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                  'images/hello.png',
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            )),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: borders.b_1px_primary,
                                            borderRadius: borderRadius.br_10,
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 12,
                                              right: 12,
                                              top: 0,
                                              bottom: 0),
                                          margin: edge_insets_x_12_y_20,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller: searchText,
                                                  onChanged: (text) {
                                                    getCubit(context)
                                                        .updateSearchTerm(text);
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: 'Search...',
                                                    border: InputBorder
                                                        .none, // Remove border for the text field
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  // Perform search action here
                                                },
                                                icon: Icon(Icons.search),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Your fellow mate challenges...',
                                                style: TextStyle(
                                                    fontSize: Fonts.fontSize24,
                                                    fontWeight: Fonts.f600),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: edge_insets_x_16,
                                          margin: edge_insets_t_32,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: state
                                                                    .challenge_filter ==
                                                                "ALL"
                                                            ? borders
                                                                .bb_1px_primary
                                                            : borders
                                                                .bb_1px_white),
                                                    child: Text(
                                                      'All',
                                                      style: TextStyle(
                                                        color:
                                                            state.challenge_filter ==
                                                                    "ALL"
                                                                ? AppColors
                                                                    .primary
                                                                : AppColors
                                                                    .grey1,
                                                        fontSize:
                                                            Fonts.fontSize18,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    this
                                                        .getCubit(context)
                                                        .changeChallengeFilter(
                                                            'ALL');
                                                  }),
                                              // InkWell(
                                              //     child: Container(
                                              //       decoration: BoxDecoration(
                                              //           border: state
                                              //                       .challenge_filter ==
                                              //                   "TODAY"
                                              //               ? borders
                                              //                   .bb_1px_primary
                                              //               : borders
                                              //                   .bb_1px_white),
                                              //       child: Text(
                                              //         'Today',
                                              //         style: TextStyle(
                                              //           color:
                                              //               state.challenge_filter ==
                                              //                       "TODAY"
                                              //                   ? AppColors
                                              //                       .primary
                                              //                   : AppColors
                                              //                       .grey1,
                                              //           fontSize:
                                              //               Fonts.fontSize18,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //     onTap: () {
                                              //       this
                                              //           .getCubit(context)
                                              //           .changeChallengeFilter(
                                              //               'TODAY');
                                              //     }),
                                              InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: state
                                                                    .challenge_filter ==
                                                                "TOP"
                                                            ? borders
                                                                .bb_1px_primary
                                                            : borders
                                                                .bb_1px_white),
                                                    child: Text(
                                                      'Top',
                                                      style: TextStyle(
                                                        color:
                                                            state.challenge_filter ==
                                                                    "TOP"
                                                                ? AppColors
                                                                    .primary
                                                                : AppColors
                                                                    .grey1,
                                                        fontSize:
                                                            Fonts.fontSize18,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    this
                                                        .getCubit(context)
                                                        .changeChallengeFilter(
                                                            'TOP');
                                                  }),
                                              InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: state
                                                                    .challenge_filter ==
                                                                "FAVOURITE"
                                                            ? borders
                                                                .bb_1px_primary
                                                            : borders
                                                                .bb_1px_white),
                                                    child: Text(
                                                      'Favourite',
                                                      style: TextStyle(
                                                        color:
                                                            state.challenge_filter ==
                                                                    "FAVOURITE"
                                                                ? AppColors
                                                                    .primary
                                                                : AppColors
                                                                    .grey1,
                                                        fontSize:
                                                            Fonts.fontSize18,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    this
                                                        .getCubit(context)
                                                        .changeChallengeFilter(
                                                            'FAVOURITE');
                                                  }),
                                            ],
                                          ),
                                        ),
                                        StreamBuilder<QuerySnapshot>(
                                          stream: fireStoreService
                                              .getChallengesStream(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            }

                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            }

                                            List<QueryDocumentSnapshot>
                                                challenges =
                                                snapshot.data!.docs;

                                            int noOfDocs =
                                                snapshot.data!.docs.length;

                                            return noOfDocs > 0
                                                ? ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        challenges.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var challengeData =
                                                          challenges[index]
                                                                  .data()
                                                              as Map<String,
                                                                  dynamic>;

                                                      if (state
                                                              .challenge_filter ==
                                                          'ALL') {
                                                        return challengeData[
                                                                        'privacy'] ==
                                                                    'PUBLIC' &&
                                                                challengeData[
                                                                        'challengeTitle']
                                                                    .toString()
                                                                    .toLowerCase()
                                                                    .contains(state
                                                                        .searchTerm!
                                                                        .toLowerCase())
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  context.push(
                                                                      "/challengedetails/${challengeData['challengeId']}");
                                                                },
                                                                child:
                                                                    Container(
                                                                        margin:
                                                                            edge_insets_t_32,
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                20,
                                                                            right:
                                                                                20,
                                                                            left:
                                                                                20,
                                                                            bottom:
                                                                                5),
                                                                        decoration: BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(colors: [
                                                                              AppColors.bmiTracker.withOpacity(0.9),
                                                                              AppColors.bmiTracker.withOpacity(0.3)
                                                                            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                                                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(50), topLeft: Radius.circular(10)),
                                                                            boxShadow: [
                                                                              BoxShadow(offset: Offset(10, 10), blurRadius: 20, color: AppColors.bmiTracker.withOpacity(0.4))
                                                                            ]),
                                                                        child: Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
// Icon(Icons.title, color: Colors.white,),
                                                                                    Text(
                                                                                      '${challengeData['challengeTitle']}',
                                                                                      style: TextStyle(fontSize: Fonts.fontSize22, color: Colors.white),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Container(
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Container(
                                                                                          padding: edge_insets_5,
                                                                                          decoration: BoxDecoration(color: AppColors.grey2, borderRadius: borderRadius.br_100, border: borders.b_1px_green),
                                                                                          margin: edge_insets_l_4,
                                                                                          child: Text(
                                                                                            '${challengeData['noOfDays']}',
                                                                                            style: TextStyle(fontSize: Fonts.fontSize14, color: Colors.black),
                                                                                          ))
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Container(
                                                                              padding: edge_insets_t_12,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.person,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  Container(
                                                                                    margin: edge_insets_l_5,
                                                                                    child: Text(
                                                                                      '${challengeData['creatorName']}',
                                                                                      style: TextStyle(fontSize: Fonts.fontSize18, color: Colors.white),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: edge_insets_t_24,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.timelapse_sharp,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      Container(
                                                                                        margin: edge_insets_l_5,
                                                                                        child: Text(
                                                                                          '2 weeks ago',
                                                                                          style: TextStyle(color: Colors.white, fontSize: Fonts.fontSize12),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      challengeData['userId'] != state.userId
                                                                                          ? state.likedChallenges != null && state.likedChallenges!.isNotEmpty && state.likedChallenges!.contains(challengeData['challengeId'])
                                                                                              ? InkWell(
                                                                                                  onTap: () {
                                                                                                    getCubit(context).removeFromLikedChallenges(challengeData['challengeId']);
                                                                                                    getCubit(context).getUserLikedChallenges();
                                                                                                  },
                                                                                                  child: ClipOval(
                                                                                                    child: Icon(
                                                                                                      Icons.thumb_up_alt_rounded,
                                                                                                      color: AppColors.bmiTracker,
                                                                                                    ),
                                                                                                  ),
                                                                                                )
                                                                                              : InkWell(
                                                                                                  onTap: () {
                                                                                                    getCubit(context).addToLikedChallenges(challengeData['challengeId']);
                                                                                                    getCubit(context).getUserLikedChallenges();
                                                                                                  },
                                                                                                  child: ClipOval(
                                                                                                    child: Icon(Icons.thumb_up_alt_outlined),
                                                                                                  ),
                                                                                                )
                                                                                          : Container(
                                                                                              child: Text(
                                                                                                "You",
                                                                                                style: TextStyle(color: Colors.grey),
                                                                                              ),
                                                                                            ),
                                                                                      IconButton(
                                                                                        onPressed: () => {},
                                                                                        style: IconButton.styleFrom(padding: edge_insets_0),
                                                                                        icon: const Icon(
                                                                                          Icons.share,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )),
                                                              )
                                                            : Container();
                                                      } else if (state
                                                              .challenge_filter ==
                                                          'FAVOURITE') {
                                                        return state
                                                                .likedChallenges!
                                                                .contains(
                                                                    challengeData[
                                                                        'challengeId'])
                                                            ? challengeData['privacy'] ==
                                                                        'PUBLIC' &&
                                                                    challengeData[
                                                                            'challengeTitle']
                                                                        .toString()
                                                                        .toLowerCase()
                                                                        .contains(state
                                                                            .searchTerm!
                                                                            .toLowerCase())
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      context.push(
                                                                          "/challengedetails/${challengeData['challengeId']}");
                                                                    },
                                                                    child:
                                                                        Container(
                                                                            margin:
                                                                                edge_insets_t_32,
                                                                            padding: const EdgeInsets.only(
                                                                                top:
                                                                                    20,
                                                                                right:
                                                                                    20,
                                                                                left:
                                                                                    20,
                                                                                bottom:
                                                                                    5),
                                                                            decoration: BoxDecoration(
                                                                                gradient: LinearGradient(colors: [
                                                                                  AppColors.bmiTracker.withOpacity(0.9),
                                                                                  AppColors.bmiTracker.withOpacity(0.3)
                                                                                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                                                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(50), topLeft: Radius.circular(10)),
                                                                                boxShadow: [
                                                                                  BoxShadow(offset: Offset(10, 10), blurRadius: 20, color: AppColors.bmiTracker.withOpacity(0.4))
                                                                                ]),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
// Icon(Icons.title, color: Colors.white,),
                                                                                        Text(
                                                                                          '${challengeData['challengeTitle']}',
                                                                                          style: TextStyle(fontSize: Fonts.fontSize22, color: Colors.white),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                              padding: edge_insets_5,
                                                                                              decoration: BoxDecoration(color: AppColors.grey2, borderRadius: borderRadius.br_100, border: borders.b_1px_green),
                                                                                              margin: edge_insets_l_4,
                                                                                              child: Text(
                                                                                                '${challengeData['noOfDays']}',
                                                                                                style: TextStyle(fontSize: Fonts.fontSize14, color: Colors.black),
                                                                                              ))
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                Container(
                                                                                  padding: edge_insets_t_12,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.person,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      Container(
                                                                                        margin: edge_insets_l_5,
                                                                                        child: Text(
                                                                                          '${challengeData['creatorName']}',
                                                                                          style: TextStyle(fontSize: Fonts.fontSize18, color: Colors.white),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  margin: edge_insets_t_24,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.timelapse_sharp,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                          Container(
                                                                                            margin: edge_insets_l_5,
                                                                                            child: Text(
                                                                                              '2 weeks ago',
                                                                                              style: TextStyle(color: Colors.white, fontSize: Fonts.fontSize12),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          challengeData['userId'] != state.userId
                                                                                              ? state.likedChallenges != null && state.likedChallenges!.isNotEmpty && state.likedChallenges!.contains(challengeData['challengeId'])
                                                                                                  ? InkWell(
                                                                                                      onTap: () {
                                                                                                        getCubit(context).removeFromLikedChallenges(challengeData['challengeId']);
                                                                                                        getCubit(context).getUserLikedChallenges();
                                                                                                      },
                                                                                                      child: ClipOval(
                                                                                                        child: Icon(
                                                                                                          Icons.thumb_up_alt_rounded,
                                                                                                          color: AppColors.bmiTracker,
                                                                                                        ),
                                                                                                      ),
                                                                                                    )
                                                                                                  : InkWell(
                                                                                                      onTap: () {
                                                                                                        getCubit(context).addToLikedChallenges(challengeData['challengeId']);
                                                                                                        getCubit(context).getUserLikedChallenges();
                                                                                                      },
                                                                                                      child: ClipOval(
                                                                                                        child: Icon(Icons.thumb_up_alt_outlined),
                                                                                                      ),
                                                                                                    )
                                                                                              : Container(
                                                                                                  child: Text(
                                                                                                    "You",
                                                                                                    style: TextStyle(color: Colors.grey),
                                                                                                  ),
                                                                                                ),
                                                                                          IconButton(
                                                                                            onPressed: () async {
                                                                                              final String appLink = 'https://play.google.com/store/apps/details?id=com.example.myapp';
                                                                                              final String message = 'Check out my new app: $appLink';

                                                                                              await FlutterShare.share(title: 'Share App', text: message, linkUrl: appLink);
                                                                                            },
                                                                                            style: IconButton.styleFrom(padding: edge_insets_0),
                                                                                            icon: const Icon(
                                                                                              Icons.share,
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            )),
                                                                  )
                                                                : Container()
                                                            : Container();
                                                      } else if (state
                                                              .challenge_filter ==
                                                          'TOP') {
                                                        return challengeData[
                                                                    'noOfPeopleJoined'] >=
                                                                3
                                                            ? challengeData['privacy'] ==
                                                                        'PUBLIC' &&
                                                                    challengeData[
                                                                            'challengeTitle']
                                                                        .toString()
                                                                        .toLowerCase()
                                                                        .contains(state
                                                                            .searchTerm!
                                                                            .toLowerCase())
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      context.push(
                                                                          "/challengedetails/${challengeData['challengeId']}");
                                                                    },
                                                                    child:
                                                                        Container(
                                                                            margin:
                                                                                edge_insets_t_32,
                                                                            padding: const EdgeInsets.only(
                                                                                top:
                                                                                    20,
                                                                                right:
                                                                                    20,
                                                                                left:
                                                                                    20,
                                                                                bottom:
                                                                                    5),
                                                                            decoration: BoxDecoration(
                                                                                gradient: LinearGradient(colors: [
                                                                                  AppColors.bmiTracker.withOpacity(0.9),
                                                                                  AppColors.bmiTracker.withOpacity(0.3)
                                                                                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                                                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(50), topLeft: Radius.circular(10)),
                                                                                boxShadow: [
                                                                                  BoxShadow(offset: Offset(10, 10), blurRadius: 20, color: AppColors.bmiTracker.withOpacity(0.4))
                                                                                ]),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
// Icon(Icons.title, color: Colors.white,),
                                                                                        Text(
                                                                                          '${challengeData['challengeTitle']}',
                                                                                          style: TextStyle(fontSize: Fonts.fontSize22, color: Colors.white),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                              padding: edge_insets_5,
                                                                                              decoration: BoxDecoration(color: AppColors.grey2, borderRadius: borderRadius.br_100, border: borders.b_1px_green),
                                                                                              margin: edge_insets_l_4,
                                                                                              child: Text(
                                                                                                '${challengeData['noOfDays']}',
                                                                                                style: TextStyle(fontSize: Fonts.fontSize14, color: Colors.black),
                                                                                              ))
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                Container(
                                                                                  padding: edge_insets_t_12,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.person,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      Container(
                                                                                        margin: edge_insets_l_5,
                                                                                        child: Text(
                                                                                          '${challengeData['creatorName']}',
                                                                                          style: TextStyle(fontSize: Fonts.fontSize18, color: Colors.white),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  margin: edge_insets_t_24,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.timelapse_sharp,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                          Container(
                                                                                            margin: edge_insets_l_5,
                                                                                            child: Text(
                                                                                              '2 weeks ago',
                                                                                              style: TextStyle(color: Colors.white, fontSize: Fonts.fontSize12),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          challengeData['userId'] != state.userId
                                                                                              ? state.likedChallenges != null && state.likedChallenges!.isNotEmpty && state.likedChallenges!.contains(challengeData['challengeId'])
                                                                                                  ? InkWell(
                                                                                                      onTap: () {
                                                                                                        getCubit(context).removeFromLikedChallenges(challengeData['challengeId']);
                                                                                                        getCubit(context).getUserLikedChallenges();
                                                                                                      },
                                                                                                      child: ClipOval(
                                                                                                        child: Icon(
                                                                                                          Icons.thumb_up_alt_rounded,
                                                                                                          color: AppColors.bmiTracker,
                                                                                                        ),
                                                                                                      ),
                                                                                                    )
                                                                                                  : InkWell(
                                                                                                      onTap: () {
                                                                                                        getCubit(context).addToLikedChallenges(challengeData['challengeId']);
                                                                                                        getCubit(context).getUserLikedChallenges();
                                                                                                      },
                                                                                                      child: ClipOval(
                                                                                                        child: Icon(Icons.thumb_up_alt_outlined),
                                                                                                      ),
                                                                                                    )
                                                                                              : Container(
                                                                                                  child: Text(
                                                                                                    "You",
                                                                                                    style: TextStyle(color: Colors.grey),
                                                                                                  ),
                                                                                                ),
                                                                                          IconButton(
                                                                                            onPressed: () => {},
                                                                                            style: IconButton.styleFrom(padding: edge_insets_0),
                                                                                            icon: const Icon(
                                                                                              Icons.share,
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            )),
                                                                  )
                                                                : Container()
                                                            : Container();
                                                      }
                                                    })
                                                : Container(
                                                    margin: EdgeInsets.only(
                                                        top: 100),
                                                    child: Text(
                                                      "No challenges created!",
                                                    ),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                bottomNavigationBar: BottomNavigationBar(
                                  items: <BottomNavigationBarItem>[
                                    BottomNavigationBarItem(
                                      icon: InkWell(
                                        onTap: () {
                                          context.push('/home');
                                        },
                                        child: Icon(
                                          Icons.home,
                                          color: AppColors.bmiTracker,
                                        ),
                                      ),
                                      label: '',
                                    ),
                                    // BottomNavigationBarItem(
                                    //   icon: InkWell(
                                    //     onTap: () {
                                    //       Navigator.pushNamed(
                                    //           context, '/signup');
                                    //     },
                                    //     child: Icon(
                                    //       Icons.search,
                                    //       color: AppColors.bmiTracker,
                                    //     ),
                                    //   ),
                                    //   label: '',
                                    // ),
                                    BottomNavigationBarItem(
                                      icon: InkWell(
                                        onTap: () {
                                          context.push('/analytics');
                                        },
                                        child: Icon(
                                          Icons.auto_graph_outlined,
                                          color: AppColors.bmiTracker,
                                        ),
                                      ),
                                      label: '',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: InkWell(
                                          onTap: () {
                                            context.push('/profile');
                                          },
                                          child: Icon(
                                            Icons.person,
                                            color: AppColors.bmiTracker,
                                          )),
                                      label: '',
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  },
                ));
          },
        ));
  }

  @override
  HomePageCubit createCubitAndAssignToController(BuildContext context) {
    HomePageCubit cubit = HomePageCubit(context: context);
    controller?.cubit = cubit;
    return cubit;
  }
}
