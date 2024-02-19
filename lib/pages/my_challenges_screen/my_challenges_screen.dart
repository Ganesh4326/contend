import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/core/widgets/base_stateless_widget.dart';
import 'package:contend/pages/my_challenges_screen/my_challenges_screen_controller.dart';
import 'package:contend/pages/my_challenges_screen/my_challenges_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../themes/borders.dart';

import '../../core/logger/log.dart';
import '../../core/widgets/base_screen_widget.dart';
import '../../services/fire_store.dart';
import '../../styles/edge_insets.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../challenge_screen/challenge_screen.dart';

class MyChallengesScreen extends BaseStatelessWidget<
    MyChallengesScreenController,
    MyChallengesScreenCubit,
    MyChallengesScreenState> {
  MyChallengesScreen({super.key});

  final FireStoreService fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyChallengesScreenCubit>(
      create: (create) => createCubitAndAssignToController(context),
      child: BlocConsumer<MyChallengesScreenCubit, MyChallengesScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          this.getCubit(context).getUserName();

          return Directionality(
              textDirection: TextDirection.ltr,
              child: Builder(
                builder: (context) => Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 40),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/home');
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
                                  "My challenges",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: Fonts.fontNunito,
                                      color: AppColors.bmiTracker,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: fireStoreService.getChallengesStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                              List<QueryDocumentSnapshot> challenges =
                                  snapshot.data!.docs;
                              logger.d(snapshot.data!.docs[0].data());

                              int noOfDocs = snapshot.data!.docs.length;
                              logger.d(noOfDocs);

                              return noOfDocs > 0
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: challenges.length,
                                      itemBuilder: (context, index) {
                                        var challengeData = challenges[index]
                                            .data() as Map<String, dynamic>;

                                        return challengeData['userId'] ==
                                                state.userId
                                            ? GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChallengeScreen(
                                                                challengeId:
                                                                    challengeData[
                                                                        'challengeId'],
                                                                pageContext:
                                                                    context,
                                                                goRouterState:
                                                                    GoRouterState())),
                                                  );
                                                },
                                                child: Container(
                                                    margin: edge_insets_t_32,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20,
                                                            right: 20,
                                                            left: 20,
                                                            bottom: 5),
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              AppColors
                                                                  .bmiTracker
                                                                  .withOpacity(
                                                                      0.9),
                                                              AppColors
                                                                  .bmiTracker
                                                                  .withOpacity(
                                                                      0.3)
                                                            ],
                                                                begin: Alignment
                                                                    .bottomLeft,
                                                                end: Alignment
                                                                    .topRight),
                                                        borderRadius: BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    50),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset: Offset(
                                                                  10, 10),
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
                                                                  '${challengeData['challengeTitle']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Fonts
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
                                                                          borderRadius: borderRadius
                                                                              .br_100,
                                                                          border: borders
                                                                              .b_1px_green),
                                                                      margin:
                                                                          edge_insets_l_4,
                                                                      child:
                                                                          Text(
                                                                        '${challengeData['noOfDays']}',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                Fonts.fontSize14,
                                                                            color: Colors.black),
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
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              Container(
                                                                margin:
                                                                    edge_insets_l_5,
                                                                child: Text(
                                                                  '${challengeData['creatorName']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Fonts
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
                                                                        () =>
                                                                            {},
                                                                    style: IconButton.styleFrom(
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
                                                                        () =>
                                                                            {},
                                                                    style: IconButton.styleFrom(
                                                                        padding:
                                                                            edge_insets_0),
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .share,
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
                                              )
                                            : Container();
                                      })
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
                                                "You haven't created any challenges yet!",
                                                style: TextStyle(
                                                    fontSize: Fonts.fontSize20,
                                                    fontWeight: Fonts.f500,
                                                    color: AppColors.primary),
                                              ))
                                        ],
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  @override
  MyChallengesScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    MyChallengesScreenCubit cubit = MyChallengesScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
