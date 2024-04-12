import 'package:contend/pages/profile_screen/profile_screen_controller.dart';
import 'package:contend/pages/profile_screen/profile_screen_cubit.dart';
import 'package:contend/pages/splash_screen/splash_screen.dart';
import 'package:contend/services/fire_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/base_stateless_widget.dart';
import '../../../../styles/edge_insets.dart';
import '../../../../themes/app_colors.dart';
import '../../auth/AuthService.dart';
import '../../themes/fonts.dart';

class ProfileScreen extends BaseStatelessWidget<ProfileScreenController,
    ProfileScreenCubit, ProfileScreenState> {
  const ProfileScreen({super.key});

  Future<void> logout() async {
    await AuthService.removeUserId();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => createCubitAndAssignToController(context),
      child: BlocConsumer<ProfileScreenCubit, ProfileScreenState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: state.userData != null
                    ? SingleChildScrollView(
                        child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.bmiTracker.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topRight: Radius.circular(0),
                              topLeft: Radius.circular(0)),
                        ),
                        height: 750,
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 60, right: 10, left: 10),
                              decoration: BoxDecoration(
                                color: AppColors.bgLightBlue.withOpacity(0.7),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              padding: EdgeInsets.only(
                                  top: 20, left: 25, right: 25, bottom: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () => {
                                            context.push('/second')
                                              },
                                          style: IconButton.styleFrom(
                                              padding: edge_insets_0),
                                          icon:
                                              const Icon(Icons.arrow_back_ios)),
                                      Text(
                                        'Profile',
                                        style: TextStyle(
                                            fontSize: Fonts.fontSize18,
                                            color: Colors.black),
                                      ),
                                      IconButton(
                                          onPressed: () => {
                                            context.push(
                                                     '/second')
                                              },
                                          style: IconButton.styleFrom(
                                              padding: edge_insets_0),
                                          icon: const Icon(Icons.share))
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 30),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'images/user1.png',
                                          width: 100, // Set your desired width
                                          height:
                                              100, // Set your desired height
                                          fit: BoxFit
                                              .cover, // Adjust the fit as needed
                                        ),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      state.userData!.userName,
                                      style:
                                          TextStyle(fontSize: Fonts.fontSize24),
                                    ),
                                  ),
                                  state.userData!.address != null
                                      ? Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            state.userData!.address!,
                                            style: TextStyle(
                                                fontSize: Fonts.fontSize18,
                                                color: Colors.white),
                                          ),
                                        )
                                      : Container(),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    padding:
                                        EdgeInsets.only(left: 17, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Created',
                                          style: TextStyle(
                                              fontSize: Fonts.fontSize18,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          'invited',
                                          style: TextStyle(
                                              fontSize: Fonts.fontSize18,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          'Completed',
                                          style: TextStyle(
                                              fontSize: Fonts.fontSize18,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding:
                                        EdgeInsets.only(left: 20, right: 27),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.userData!.noOfChallengesCreated
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: Fonts.fontSize24,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          state.userData!.noOfChallengesAccepted
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: Fonts.fontSize24,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          state
                                              .userData!.noOfChallengesCompleted
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: Fonts.fontSize24,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: AppColors.bgLightBlue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30)),
                              ),
                              height: 10,
                              child: Column(
                                children: [],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(fontSize: 25),
                                ),
                                onPressed: () async {
                                  this.getCubit(context).logoutUser();
                                  // FireStoreService()
                                  //     .getUserData("OpKHoGrpRis7rhFmymRH");
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             SplashScreen()));
                                  context.push("/splash");
                                },
                              ),
                            )
                          ],
                        ),
                      ))
                    : Container(child: Text("Loading")),
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
            );
          }),
    );
  }

  @override
  ProfileScreenCubit createCubitAndAssignToController(BuildContext context) {
    ProfileScreenCubit cubit = ProfileScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
