import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/base_stateless_widget.dart';
import 'package:go_router/go_router.dart';

import '../../styles/edge_insets.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import 'users_user_requests_friends_controller.dart';
import 'users_user_requests_friends_cubit.dart';

class UsersUserRequestsFriends extends BaseStatelessWidget<
    UsersUserRequestsFriendsController,
    UsersUserRequestsFriendsCubit,
    UsersUserRequestsFriendsState> {
  UsersUserRequestsFriends({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersUserRequestsFriendsCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<UsersUserRequestsFriendsCubit,
          UsersUserRequestsFriendsState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: Container(
              margin: edge_insets_x_24_y_17,
              child: state.requestUsers != null
                  ? ListView.builder(
                      itemCount: state.requestUsers!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: edge_insets_t_12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        state.requestUsers![index].userName,
                                        style: TextStyle(
                                            fontSize: Fonts.fontSize18),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: edge_insets_r_7,
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: AppColors.green,
                                        size: 20,
                                      )),
                                  Text(
                                    "Requested",
                                    style: TextStyle(color: AppColors.green),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      })
                  : Container(
                      child: Text("No users"),
                    ),
            ),
          );
        },
      ),
    );
  }

  @override
  UsersUserRequestsFriendsCubit createCubitAndAssignToController(
      BuildContext context) {
    UsersUserRequestsFriendsCubit cubit =
        UsersUserRequestsFriendsCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
