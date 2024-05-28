import 'package:contend/core/widgets/base_screen_widget.dart';
import 'package:contend/styles/edge_insets.dart';
import 'package:contend/themes/app_colors.dart';
import 'package:contend/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/base_stateless_widget.dart';
import 'package:go_router/go_router.dart';

import 'manage_friends_screen_controller.dart';
import 'manage_friends_screen_cubit.dart';

class ManageFriendsScreen extends BaseStatelessWidget<
    ManageFriendsScreenController,
    ManageFriendsScreenCubit,
    ManageFriendsScreenState> {
  ManageFriendsScreen({
    Key? key,
    super.controller,
    super.onStateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageFriendsScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ManageFriendsScreenCubit, ManageFriendsScreenState>(
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
                        "Manage friends",
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
                    margin: edge_insets_x_24,
                    child: state.users!.length > 0
                        ? ListView.builder(
                            itemCount: state.users!.length,
                            itemBuilder: (context, index) {
                              return !(state.friendsList!.contains(
                                          state.users![index]!['userId']) &&
                                      state.users![index]!['userId'] !=
                                          state.userId)
                                  ? Container(
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
                                                  backgroundImage: AssetImage(
                                                      'images/user3.png'),
                                                ),
                                                Container(
                                                  margin: edge_insets_l_9,
                                                  child: Text(
                                                    state.users![index]![
                                                        'userName'],
                                                    style: TextStyle(
                                                        fontSize:
                                                            Fonts.fontSize18),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          !(state.requests!.contains(
                                                      state.users![index]![
                                                          'userId'])) &&
                                                  !(state.userNames!.contains(
                                                      state.users![index]![
                                                          'userId']))
                                              ? InkWell(
                                                  onTap: () {
                                                    getCubit(context).addToList(
                                                        state.users![index]![
                                                            'userId']);
                                                  },
                                                  child: Image.asset(
                                                    'images/add_friend.png',
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                )
                                              : Row(
                                                  children: [
                                                    Container(
                                                        margin: edge_insets_r_7,
                                                        child: Icon(
                                                          Icons.check_rounded,
                                                          color:
                                                              AppColors.green,
                                                          size: 20,
                                                        )),
                                                    Text(
                                                      "Requested",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.green),
                                                    )
                                                  ],
                                                )
                                        ],
                                      ),
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
                                      "No users found!",
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
            ),
          );
        },
      ),
    );
  }

  @override
  ManageFriendsScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    ManageFriendsScreenCubit cubit = ManageFriendsScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
