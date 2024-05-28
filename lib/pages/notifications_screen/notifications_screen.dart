import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/base_stateless_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import 'notifications_screen_controller.dart';
import 'notifications_screen_cubit.dart';

class NotificationsScreen extends BaseStatelessWidget<
    NotificationsScreenController,
    NotificationsScreenCubit,
    NotificationsScreenState> {
  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsScreenCubit>(
      create: (create) => createCubitAndAssignToController(context),
      child: BlocConsumer<NotificationsScreenCubit, NotificationsScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, left: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.push('/home');
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
                            "Notifications",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: Fonts.fontNunito,
                                color: AppColors.bmiTracker,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.grey2
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.circle,
                                    size: 8,
                                  )),
                              Text("'First challenge' Challenge \ncreated successfully", style: TextStyle(
                                fontFamily: Fonts.fontNunito,
                                fontSize: Fonts.fontSize16,
                              ),),
                            ],
                          ),
                          Text("27/04")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.skyBlue
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.circle,
                                    size: 8,
                                  )),
                              Text("'New challenge was created \nby Ramu!", style: TextStyle(
                                fontFamily: Fonts.fontNunito,
                                fontSize: Fonts.fontSize16,
                              ),),
                            ],
                          ),
                          Text("21/04")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.greyWhite
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.circle,
                                    size: 8,
                                  )),
                              Text("Just 5 days left for challenge \nJunk food", style: TextStyle(
                                fontFamily: Fonts.fontNunito,
                                fontSize: Fonts.fontSize16,
                              ),),
                            ],
                          ),
                          Text("19/04")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.coinProgress
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.circle,
                                    size: 8,
                                  )),
                              Text("Congratulations! you successfully \ncompleted Workout challenge", style: TextStyle(
                                fontFamily: Fonts.fontNunito,
                                fontSize: Fonts.fontSize16,
                              ),),
                            ],
                          ),
                          Text("11/04")
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }

  @override
  NotificationsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    NotificationsScreenCubit cubit = NotificationsScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
