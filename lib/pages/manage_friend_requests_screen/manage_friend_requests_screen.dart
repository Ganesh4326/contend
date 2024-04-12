import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/base_stateless_widget.dart';

import 'package:go_router/go_router.dart';

import '../../styles/edge_insets.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import 'manage_friend_requests_screen_controller.dart';
import 'manage_friend_requests_screen_cubit.dart';

class ManageFriendRequestsScreen extends BaseStatelessWidget<
    ManageFriendRequestsScreenController,
    ManageFriendRequestsScreenCubit,
    ManageFriendRequestsScreenState> {
  ManageFriendRequestsScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageFriendRequestsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ManageFriendRequestsScreenCubit,
          ManageFriendRequestsScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
              body: Column(
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
                      "Friend requests",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: Fonts.fontNunito,
                          color: AppColors.bmiTracker,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: edge_insets_x_24_y_17,
                  child: state.friendRequestNames!.length > 0
                      ? ListView.builder(
                          itemCount: state.friendRequestNames!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: edge_insets_t_12,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage: AssetImage('images/user3.png'),
                                        ),
                                        Container(
                                          margin: edge_insets_l_9,
                                          child: Text(
                                            state.friendRequestNames![index],
                                            style: TextStyle(
                                                fontSize: Fonts.fontSize18),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        getCubit(context).addToFriendList(
                                            state.friendRequests![index]);
                                      },
                                      child: Text("Accept", style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize14,
                                        color: AppColors.bmiTracker
                                      ),))
                                ],
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
                                    "No requests for you!",
                                    style: TextStyle(
                                        fontSize: Fonts.fontSize20,
                                        fontWeight: Fonts.f500,
                                        color: AppColors.primary),
                                  ))
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }

  @override
  ManageFriendRequestsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    ManageFriendRequestsScreenCubit cubit =
        ManageFriendRequestsScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
