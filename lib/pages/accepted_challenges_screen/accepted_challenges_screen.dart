import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/core/widgets/base_screen_widget.dart';
import 'package:contend/core/widgets/base_stateless_widget.dart';
import 'package:contend/pages/accepted_challenges_screen/accepted_challenges_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/challenge.dart';
import '../../../themes/borders.dart';
import '../../services/fire_store.dart';
import '../../styles/edge_insets.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../challenge_screen/challenge_screen.dart';
import 'accepted_challenges_screen_controller.dart';

class AcceptedChallengesScreen extends BaseStatelessWidget<
    AcceptedChallengesScreenController,
    AcceptedChallengesScreenCubit,
    AcceptedChallengesScreenState> {
  AcceptedChallengesScreen({super.key});

  final FireStoreService fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AcceptedChallengesScreenCubit>(
      create: (create) => createCubitAndAssignToController(context),
      child: BlocConsumer<AcceptedChallengesScreenCubit,
          AcceptedChallengesScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, left: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.push( '/home');
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
                            "Accepted challenges",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: Fonts.fontNunito,
                                color: AppColors.bmiTracker,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),

                    state.userId != null
                        ? Expanded(
                            child: FutureBuilder<List<dynamic>>(
                              future:
                                  fireStoreService.getAcceptedChallengesByUserId(
                                state.userId!,
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return Center(
                                      child: Text('No accepted challenges.'));
                                } else {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      String challengeId = snapshot.data![index];
                                      return FutureBuilder<Challenge?>(
                                        future: fireStoreService
                                            .getChallengeById(challengeId),
                                        builder: (context, challengeSnapshot) {
                                          if (challengeSnapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          } else if (challengeSnapshot.hasError) {
                                            return Text(
                                                'Error: ${challengeSnapshot.error}');
                                          } else if (!challengeSnapshot.hasData ||
                                              challengeSnapshot.data == null) {
                                            return Text(
                                                'Challenge with ID $challengeId not found.');
                                          } else {
                                            Challenge challenge =
                                                challengeSnapshot.data!;
                                            return Container(
                                              padding: EdgeInsets.only(
                                                  left: 25, right: 25),
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           ChallengeScreen(
                                                  //             challengeId:
                                                  //                 challenge
                                                  //                     .challengeId,
                                                  //           )),
                                                  // );
                                                  context.push("/challengedetails/${challenge.challengeId}");
                                                },
                                                child: Container(
                                                    margin: edge_insets_t_32,
                                                    padding: const EdgeInsets.only(
                                                        top: 20,
                                                        right: 20,
                                                        left: 20,
                                                        bottom: 5),
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              AppColors.bmiTracker
                                                                  .withOpacity(
                                                                      0.9),
                                                              AppColors.bmiTracker
                                                                  .withOpacity(
                                                                      0.3)
                                                            ],
                                                            begin: Alignment
                                                                .bottomLeft,
                                                            end: Alignment
                                                                .topRight),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(10),
                                                                bottomRight: Radius
                                                                    .circular(10),
                                                                topRight: Radius
                                                                    .circular(50),
                                                                topLeft: Radius
                                                                    .circular(10)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset:
                                                                  Offset(10, 10),
                                                              blurRadius: 20,
                                                              color: AppColors
                                                                  .bmiTracker
                                                                  .withOpacity(
                                                                      0.4))
                                                        ]),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  challenge
                                                                      .challengeTitle,
                                                                  style: TextStyle(
                                                                      fontSize: Fonts
                                                                          .fontSize22,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      padding:
                                                                          edge_insets_5,
                                                                      decoration: BoxDecoration(
                                                                          color: AppColors
                                                                              .grey2,
                                                                          borderRadius:
                                                                              borderRadius
                                                                                  .br_100,
                                                                          border: borders
                                                                              .b_1px_green),
                                                                      margin:
                                                                          edge_insets_l_4,
                                                                      child: Text(
                                                                        challenge
                                                                            .noOfDays,
                                                                        style: TextStyle(
                                                                            fontSize: Fonts
                                                                                .fontSize14,
                                                                            color:
                                                                                Colors.black),
                                                                      ))
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          padding:
                                                              edge_insets_t_12,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Icon(
                                                                Icons.person,
                                                                color:
                                                                    Colors.white,
                                                              ),
                                                              Container(
                                                                margin:
                                                                    edge_insets_l_5,
                                                                child: Text(
                                                                  challenge
                                                                      .creatorName,
                                                                  style: TextStyle(
                                                                      fontSize: Fonts
                                                                          .fontSize18,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              edge_insets_t_24,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .timelapse_sharp,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  Container(
                                                                    margin:
                                                                        edge_insets_l_5,
                                                                    child: Text(
                                                                      '2 weeks ago',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              Fonts.fontSize12),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  IconButton(
                                                                    onPressed:
                                                                        () => {},
                                                                    style: IconButton
                                                                        .styleFrom(
                                                                            padding:
                                                                                edge_insets_0),
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .thumb_up,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () => {},
                                                                    style: IconButton
                                                                        .styleFrom(
                                                                            padding:
                                                                                edge_insets_0),
                                                                    icon:
                                                                        const Icon(
                                                                      Icons.share,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          )
                        : Container(
                            margin: edge_insets_t_70,
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/illustration.jpeg',
                                  width: 200,
                                  height: 200,
                                ),
                                Container(
                                    margin: edge_insets_y_24,
                                    child: Text(
                                      "You haven't accepted any challenes yet!",
                                      style: TextStyle(
                                          fontSize: Fonts.fontSize20,
                                          fontWeight: Fonts.f500,
                                          color: AppColors.primary),
                                    ))
                              ],
                            ),
                          ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  AcceptedChallengesScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    AcceptedChallengesScreenCubit cubit = AcceptedChallengesScreenCubit(context: context);
    controller?.cubit = cubit;
    return cubit;
  }
}
