import 'package:contend/models/challenge.dart';
import 'package:contend/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/base_stateless_widget.dart';

import '../../styles/edge_insets.dart';
import '../../themes/app_colors.dart';
import 'challenges_analytics_screen_controller.dart';
import 'challenges_analytics_screen_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '';

class ChallengesAnalyticsScreen extends BaseStatelessWidget<
    ChallengesAnalyticsScreenController,
    ChallengesAnalyticsScreenCubit,
    ChallengesAnalyticsScreenState> {
  ChallengesAnalyticsScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChallengesAnalyticsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ChallengesAnalyticsScreenCubit,
          ChallengesAnalyticsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin: edge_insets_x_24,
                child: Column(
                  children: [
                    Container(
                      margin: edge_insets_x_16,
                      padding: edge_insets_t_32,
                      child: Row(
                        children: [
                          Text(
                            "Challenge analytics",
                            style: TextStyle(
                                fontSize: Fonts.fontSize24,
                                fontWeight: Fonts.f700),
                          )
                        ],
                      ),
                    ),
                    state.allChallenges != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.allChallenges!.length,
                            itemBuilder: (context, index) {
                              Challenge challenge = state.allChallenges![index];
                              return Container(
                                margin: edge_insets_t_16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.grey2,
                                    // Border color
                                    width: 1.5, // Border width
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: edge_insets_16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${index + 1}. ${challenge.challengeTitle}",
                                              style: TextStyle(
                                                  fontSize: Fonts.fontSize20),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: edge_insets_t_24,
                                          child: Row(
                                            children: [
                                              LinearPercentIndicator(
                                                width: 270.0,
                                                lineHeight: 26.0,
                                                percent: state.percentages![
                                                            index] ==
                                                        'NaN'
                                                    ? 0.0
                                                    : state.percentages![index],
                                                progressColor: Colors.red,
                                                barRadius: Radius.circular(10),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: edge_insets_t_28,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total no.of days: ",
                                                style: TextStyle(
                                                    color: AppColors.grey1),
                                              ),
                                              Text(
                                                "${challenge.noOfDays}",
                                                style: TextStyle(
                                                    fontSize: Fonts.fontSize18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: edge_insets_t_8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "No of days left: ",
                                                style: TextStyle(
                                                    color: AppColors.grey1),
                                              ),
                                              Text(
                                                "${state.noOfDaysLeft![index]}",
                                                style: TextStyle(
                                                    fontSize: Fonts.fontSize18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
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
                                      "You don't have any active challenges!",
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
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
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
                //       Navigator.pushNamed(context, '/signup');
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
                      Navigator.pushNamed(context, '/analytics');
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
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Icon(
                        Icons.person,
                        color: AppColors.bmiTracker,
                      )),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  ChallengesAnalyticsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    ChallengesAnalyticsScreenCubit cubit =
        ChallengesAnalyticsScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
