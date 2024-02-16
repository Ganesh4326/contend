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
                  child: state.friendRequests!.length > 0
                      ? ListView.builder(
                          itemCount: state.friendRequests!.length,
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
                                        Image.asset(
                                          'images/user2.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                        Container(
                                          margin: edge_insets_l_9,
                                          child: Text(
                                            state.friendRequestsUsers![index]
                                                .userName,
                                            style: TextStyle(
                                                fontSize: Fonts.fontSize18),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        getCubit(context).addToFriendList(state
                                            .friendRequestsUsers![index]
                                            .userId);
                                      },
                                      child: Text("Accept"))
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
                              )
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
