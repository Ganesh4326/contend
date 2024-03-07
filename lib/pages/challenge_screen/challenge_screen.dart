import 'dart:math';

import 'package:contend/core/widgets/base_stateless_widget.dart';
import 'package:contend/models/challenge.dart';
import 'package:contend/pages/challenge_screen/challenge_screen_controller.dart';
import 'package:contend/pages/challenge_screen/challenge_screen_cubit.dart';
import 'package:contend/pages/home_page/home_page.dart';
import 'package:contend/services/fire_store.dart';
import 'package:contend/services/user_provider.dart';
import 'package:contend/widgets/checkbox_wid/checkbox_wid_controller.dart';
import 'package:contend/widgets/checkbox_wid/checkbox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../auth/AuthService.dart';
import '../../core/logger/log.dart';
import '../../core/widgets/base_screen_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../../widgets/challenge_user_comment_section_modal/challenge_user_comment_section_modal.dart';

class ChallengeScreen extends BaseScreenWidget<ChallengeScreenController,
    ChallengeScreenCubit, ChallengeScreenState> {
  late String challengeId = '';

  CheckboxWidController checkboxWidController = CheckboxWidController();

  bool isChecked = false;

  ChallengeScreen(
      {required this.challengeId,
      super.key,
      required super.pageContext,
      required super.goRouterState});

  Future<Challenge?> challenge =
      FireStoreService().getChallengeById('sgganesh@gmail.com');

  Future<Challenge?> fetchChallenge() async {
    return await FireStoreService().getChallengeById(challengeId);
  }

  printChallenge() async {
    Challenge? challenge =
        await FireStoreService().getChallengeById(challengeId);
    print('CHALLENGE TITLE: ' + challenge!.challengeTitle!);
  }

  final FireStoreService fireStoreService = FireStoreService();

  void joinChallenge(String userId, String challengeId) async {
    String userId = 'user123'; // replace with actual user ID
    String challengeId =
        '8806028b-7438-4518-b77a-b2b968ca9861'; // replace with actual challenge ID
    await fireStoreService.createChallengeJoin(userId, challengeId);
    print("JOINED:");
  }

  _launchWhatsapp(BuildContext context) async {
    var whatsapp = "+919347976049";
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  int? extractNumber(String input) {
    String number = '';
    for (int i = 0; i < input.length; i++) {
      if (input[i].contains(RegExp(r'[0-9]'))) {
        number += input[i];
      } else {
        break;
      }
    }
    logger.d(number);
    return int.tryParse(number);
  }

  showAlertDialogForJoinChallenge(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Congratulations!"),
      content: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Text("Joined challenge successfully")
        ],
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogForChallengeComplete(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Congratulations!"),
      content: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: AppColors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Daily challenge completed")
            ],
          ),
          Row(
            children: [
              Icon(Icons.currency_bitcoin),
              SizedBox(
                width: 10,
              ),
              Text("Received 10 coins")
            ],
          )
        ],
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChallengeScreenCubit>(
      create: (create) => createCubitAndAssignToController(context),
      child: BlocConsumer<ChallengeScreenCubit, ChallengeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          return FutureBuilder<Challenge?>(
            future: fetchChallenge(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                Challenge challenge = snapshot.data!;

                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Scaffold(
                    body: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                            color: AppColors.grey2.withOpacity(0.5)),
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 0, left: 20, right: 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // FireStoreService()
                                              //     .getAllAcceptedChallengeIds(
                                              //   '',
                                              // );

                                              Navigator.pop(context);
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           HomePage()),
                                              // );
                                            },
                                            child: Icon(
                                              Icons.arrow_back_ios_new,
                                              color: AppColors.bmiTracker,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${challenge.challengeTitle}",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: Fonts.fontNunito,
                                                color: AppColors.bmiTracker,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    challenge.userId != state.userId
                                        ? state.likedChallenges!.isNotEmpty && state.likedChallenges!
                                                .contains(challengeId)
                                            ? InkWell(
                                                onTap: () {
                                                  getCubit(context)
                                                      .removeFromLikedChallenges(
                                                          challengeId);
                                                  getCubit(context)
                                                      .getUserLikedChallenges();
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
                                                  getCubit(context)
                                                      .addToLikedChallenges(
                                                          challengeId);
                                                  getCubit(context)
                                                      .getUserLikedChallenges();
                                                },
                                                child: ClipOval(
                                                  child: Icon(Icons
                                                      .thumb_up_alt_outlined),
                                                ),
                                              )
                                        : Container(
                                            child: Text(
                                              "You",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                  ],
                                )),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 10, right: 20),
                              padding: EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppColors.bmiTracker,
                                  // Border color
                                  width: 1.5, // Border width
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage('images/user3.png'),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 30),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Created by",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              "${challenge.creatorName}",
                                              style: TextStyle(
                                                  color: AppColors.primary,
                                                  fontSize: 20),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Created on: ",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(
                                    "13-12-2023",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10, left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Description:",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(" ${challenge.about}")
                                      ],
                                    )
                                  ],
                                )),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 10, right: 10),
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // Background color
                                borderRadius: BorderRadius.circular(15),
                                // Rounded corners
                                border: Border.all(
                                  color: AppColors.bmiTracker,
                                  // Border color
                                  width: 1.5, // Border width
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'images/team.png',
                                              width: 20,
                                              // Set your desired width
                                              height: 20,
                                              // Set your desired height
                                              fit: BoxFit
                                                  .cover, // Adjust the fit as needed
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${challenge.noOfPeopleJoined} Joins",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: AppColors.primary),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'images/checked.png',
                                              width: 20,
                                              // Set your desired width
                                              height: 20,
                                              // Set your desired height
                                              fit: BoxFit
                                                  .cover, // Adjust the fit as needed
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${challenge.noOfPeopleCompleted} Completed",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: AppColors.primary),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            (state.allAcceptedChallengeIdsList!
                                    .contains(challengeId))
                                ? Container(
                                    margin: EdgeInsets.only(left: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "No of days Left: ",
                                          style: TextStyle(
                                              fontFamily: Fonts.fontNunito,
                                              fontSize: Fonts.fontSize20,
                                              fontWeight: Fonts.f500,
                                              color: AppColors.grey1),
                                        ),
                                        Text(
                                          state.noOfDaysLeft.toString(),
                                          style: TextStyle(
                                              fontFamily: Fonts.fontNunito,
                                              fontSize: Fonts.fontSize24,
                                              fontWeight: Fonts.f700,
                                              color: AppColors.primary),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 20, left: 10, right: 10),
                              padding: EdgeInsets.only(bottom: 30),
                              decoration: BoxDecoration(
                                color: AppColors.bmiTracker.withOpacity(0.3),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 30, top: 40),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Challenges",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            )),
                                        (state.allAcceptedChallengeIdsList!
                                                .contains(challengeId))
                                            ? Container(
                                                padding: EdgeInsets.only(
                                                    right: 30, top: 40),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Checkbox(
                                                      value: state
                                                              .daily_challenges!
                                                              .contains(
                                                                  challengeId) ??
                                                          false,
                                                      onChanged: (value) async {
                                                        await fireStoreService
                                                            .addChallengeToDailyChallenges(
                                                                challengeId,
                                                                state.userId!);
                                                        await FireStoreService()
                                                            .reduceDaysLeft(
                                                                state.userId!,
                                                                challenge
                                                                    .challengeId);
                                                        await this
                                                            .getCubit(context)
                                                            .getNoOfDaysLeft();
                                                        await this
                                                            .getCubit(context)
                                                            .getUserDailyChallenges();
                                                        showAlertDialogForChallengeComplete(
                                                            context);
                                                      },
                                                    ),
                                                  ],
                                                ))
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        challenge.task1 != ''
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, left: 30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'images/one.png',
                                                                width: 20,
                                                                // Set your desired width
                                                                height: 20,
                                                                // Set your desired height
                                                                fit: BoxFit
                                                                    .cover, // Adjust the fit as needed
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${challenge.task1}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          // Checkbox(
                                                          //   value: isChecked,
                                                          //   onChanged:
                                                          //       (bool? value) {},
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        challenge.task2 != ''
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, left: 30),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'images/two.png',
                                                                width: 20,
                                                                // Set your desired width
                                                                height: 20,
                                                                // Set your desired height
                                                                fit: BoxFit
                                                                    .cover, // Adjust the fit as needed
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${challenge.task2}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          // Checkbox(
                                                          //   value: isChecked,
                                                          //   onChanged:
                                                          //       (bool? value) {},
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        challenge.task3 != ''
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, left: 30),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'images/three.png',
                                                                width: 20,
                                                                // Set your desired width
                                                                height: 20,
                                                                // Set your desired height
                                                                fit: BoxFit
                                                                    .cover, // Adjust the fit as needed
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${challenge.task2}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          // Checkbox(
                                                          //   value: isChecked,
                                                          //   onChanged:
                                                          //       (bool? value) {},
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        challenge.task4 != ''
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, left: 30),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'images/four.png',
                                                                width: 20,
                                                                // Set your desired width
                                                                height: 20,
                                                                // Set your desired height
                                                                fit: BoxFit
                                                                    .cover, // Adjust the fit as needed
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${challenge.task4}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        challenge.task5 != ''
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, left: 30),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'images/five.png',
                                                                width: 20,
                                                                // Set your desired width
                                                                height: 20,
                                                                // Set your desired height
                                                                fit: BoxFit
                                                                    .cover, // Adjust the fit as needed
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${challenge.task5}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          // Checkbox(
                                                          //   value: isChecked,
                                                          //   onChanged:
                                                          //       (bool? value) {},
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        challenge.task6 != ''
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, left: 30),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'images/six.png',
                                                                width: 20,
                                                                // Set your desired width
                                                                height: 20,
                                                                // Set your desired height
                                                                fit: BoxFit
                                                                    .cover, // Adjust the fit as needed
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${challenge.task6}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          // Checkbox(
                                                          //   value: isChecked,
                                                          //   onChanged:
                                                          //       (bool? value) {},
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        challenge.task7 != ''
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20, left: 30),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'images/seven.png',
                                                                width: 20,
                                                                // Set your desired width
                                                                height: 20,
                                                                // Set your desired height
                                                                fit: BoxFit
                                                                    .cover, // Adjust the fit as needed
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${challenge.task7}",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          // Checkbox(
                                                          //   value: isChecked,
                                                          //   onChanged:
                                                          //       (bool? value) {},
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ChallengeUserCommentSectionModal(challengeId: challengeId,),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 60, left: 15, right: 15, bottom: 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          // printChallenge();
                                          // _launchWhatsapp(context);
                                          final String appLink =
                                              'https://play.google.com/store/apps/details?id=com.example.myapp';
                                          final String message =
                                              'Check out my new app: $appLink';

                                          await FlutterShare.share(
                                              title: 'Share App',
                                              text: message,
                                              linkUrl: appLink);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40.0, vertical: 10.0), backgroundColor: AppColors
                                              .bmiTracker, // Set background color to white
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.share,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Share',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Fonts.fontSize20),
                                            ),
                                          ],
                                        )),
                                    !(state.allAcceptedChallengeIdsList!
                                            .contains(challengeId))
                                        ? ElevatedButton(
                                            onPressed: () async {
                                              int noOfDays = 0;
                                              int? n = extractNumber(
                                                  challenge.noOfDays);
                                              if (challenge.noOfDays
                                                  .contains("month")) {
                                                noOfDays = n! * 30;
                                              }

                                              this
                                                  .getCubit(context)
                                                  .addToAcceptedChallenges(
                                                      challengeId, noOfDays);
                                              await this
                                                  .getCubit(context)
                                                  .getNoOfDaysLeft();
                                              await this
                                                  .getCubit(context)
                                                  .getAllAcceptedChallengesIdsList();
                                              showAlertDialogForJoinChallenge(
                                                  context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40.0,
                                                  vertical: 10.0), backgroundColor: AppColors.bmiTracker,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Join',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Fonts.fontSize20),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_sharp,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ))
                                        : Container(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // getCubit(context)
                                                  //     .removeChallengeFromAcceptedChallenges(
                                                  //         challengeId);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 40.0,
                                                      vertical: 10.0), backgroundColor: AppColors
                                                      .bmiTracker,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              Fonts.fontSize20),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_sharp,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                // If no data is available, display a message
                return Text('No challenge data available.');
              }
            },
          );
        },
      ),
    );
  }

  @override
  ChallengeScreenCubit createCubitAndAssignToController(BuildContext context) {
    ChallengeScreenCubit cubit = ChallengeScreenCubit(challengeId: challengeId);
    controller?.cubit = cubit;
    return cubit;
  }
}
