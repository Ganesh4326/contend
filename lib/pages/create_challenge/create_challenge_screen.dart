import 'package:contend/auth/AuthService.dart';
import 'package:contend/core/widgets/base_stateless_widget.dart';
import 'package:contend/models/challenge.dart';
import 'package:contend/pages/create_challenge/create_challenge_controller.dart';
import 'package:contend/pages/create_challenge/create_challenge_screen_cubit.dart';
import 'package:contend/pages/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../core/widgets/base_screen_widget.dart';
import '../../services/fire_store.dart';
import '../../services/user_provider.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';

class CreateChallengeScreen extends BaseStatelessWidget<
    CreateChallengeScreenController, CreateChallengeScreenCubit, CreateChallengeScreenState> {
  CreateChallengeScreen({super.key});

  final FireStoreService fireStoreService = FireStoreService();

  TextEditingController challengeTitleController = TextEditingController();
  TextEditingController creatorNameController = TextEditingController();
  TextEditingController task1Controller = TextEditingController();
  TextEditingController task2Controller = TextEditingController();
  TextEditingController task3Controller = TextEditingController();
  TextEditingController task4Controller = TextEditingController();
  TextEditingController task5Controller = TextEditingController();
  TextEditingController task6Controller = TextEditingController();
  TextEditingController task7Controller = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  Future<void> createChallenge(BuildContext context, String no_of_days,
      int no_of_tasks, String privacy) async {
    String? userId = await AuthService.getUserId();

    String challengeId = Uuid().v4();

    try {
      Challenge newChallenge = Challenge(
          userId: userId!,
          challengeId: challengeId,
          challengeTitle: challengeTitleController.text,
          creatorName: creatorNameController.text,
          noOfCoins: no_of_tasks * 5,
          noOfDays: no_of_days,
          noOfPeopleCompleted: 0,
          noOfPeopleJoined: 0,
          noOfTasks: no_of_tasks,
          task1: task1Controller.text,
          task2: task2Controller.text,
          task3: task3Controller.text,
          task4: task4Controller.text,
          task5: task5Controller.text,
          task6: task6Controller.text,
          task7: task7Controller.text,
          privacy: privacy,
          noOflikes: 0,
          noOfshares: 0,
          about: aboutController.text);

      await fireStoreService.createChallenge(newChallenge);
    } catch (e) {
      print('Error registering user: $e');
      // Handle registration errors here
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      duration: Duration(seconds: 2),
    );

    // Show the SnackBar in the context of the Scaffold
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateChallengeScreenCubit>(
        create: (create) => createCubitAndAssignToController(context),
        child: BlocConsumer<CreateChallengeScreenCubit,
            CreateChallengeScreenState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return BlocProvider<CreateChallengeScreenCubit>(
                create: (create) => createCubitAndAssignToController(context),
                child: BlocConsumer<CreateChallengeScreenCubit,
                    CreateChallengeScreenState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Directionality(
                      textDirection: TextDirection.ltr,
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        body: SingleChildScrollView(
                            child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 40, bottom: 50),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.bmiTracker.withOpacity(0.5),
                              AppColors.bmiTracker.withOpacity(0)
                            ], begin: Alignment.bottomLeft, end: Alignment.topRight),),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 60, left: 0, right: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Create challenge",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: Fonts.fontNunito,
                                            color: AppColors.bmiTracker,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: 290,
                                margin: EdgeInsets.only(top: 40),
                                padding: EdgeInsets.only(left: 15),
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
                                child: TextField(
                                  controller: challengeTitleController,
                                  onChanged: (value) {},
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.bmiTracker),
                                  decoration: InputDecoration(
                                      labelText: "Challenge title",
                                      border: InputBorder.none,
                                      hintText: "75 days challenge"),
                                ),
                              ),
                              Container(
                                width: 290,
                                margin: EdgeInsets.only(top: 40),
                                padding: EdgeInsets.only(left: 15),
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
                                child: TextField(
                                  controller: creatorNameController,
                                  onChanged: (value) {},
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.bmiTracker),
                                  decoration: InputDecoration(
                                      labelText: "Creator name",
                                      border: InputBorder.none,
                                      hintText: "John Doe"),
                                ),
                              ),
                              Container(
                                width: 290,
                                margin: EdgeInsets.only(top: 40),
                                padding: EdgeInsets.only(left: 15),
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
                                child: TextField(
                                  controller: aboutController,
                                  onChanged: (value) {},
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.bmiTracker),
                                  decoration: InputDecoration(
                                      labelText: "Description",
                                      border: InputBorder.none,
                                      hintText: "This is my first challenge"),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 30, left: 4, right: 10),
                                  padding: EdgeInsets.only(left: 15, right: 30),
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
                                        color:
                                            AppColors.primary.withOpacity(0.2),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "No of days",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      DropdownButton<String>(
                                        value: state.no_of_days,
                                        onChanged: (String? newValue) {
                                          this
                                              .getCubit(context)
                                              .setNoOfDays(newValue!);
                                        },
                                        items: <String>[
                                          '1 day',
                                          '5 days',
                                          '10 days',
                                          '15 days',
                                          '1 month',
                                          '2 months',
                                          '3 months',
                                          '4 months',
                                          '5 month',
                                          '6 months',
                                          '7 months',
                                          '8 months',
                                          '9 months',
                                          '10 months',
                                          '11 months',
                                          '12 months',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 30, left: 4, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppColors.bmiTracker,
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
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Challenge type",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(right: 50),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: 'PUBLIC',
                                              groupValue: state.privacy,
                                              onChanged: (value) {
                                                this
                                                    .getCubit(context)
                                                    .setPrivacy('PUBLIC');
                                              },
                                            ),
                                            Text(
                                              'Public',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.bgPrimary2),
                                            ),
                                            Radio(
                                              value: 'PRIVATE',
                                              groupValue: state.privacy,
                                              onChanged: (value) {
                                                this
                                                    .getCubit(context)
                                                    .setPrivacy('PRIVATE');
                                              },
                                            ),
                                            Text(
                                              'Private',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.bgPrimary2),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30, left: 10),
                                child: Text("Create tasks"),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    state.no_of_tasks! > 0
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Rounded corners
                                              border: Border.all(
                                                color: AppColors.bmiTracker,
                                                // Border color
                                                width: 1.5, // Border width
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 290,
                                            padding: EdgeInsets.only(left: 20),
                                            margin: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: TextField(
                                              controller: task1Controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  labelText: "Task 1",
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    state.no_of_tasks! > 1
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Rounded corners
                                              border: Border.all(
                                                color: AppColors.bmiTracker,
                                                // Border color
                                                width: 1.5, // Border width
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 290,
                                            padding: EdgeInsets.only(left: 20),
                                            margin: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: TextField(
                                              controller: task2Controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  labelText: "Task 2",
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    state.no_of_tasks! > 2
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Rounded corners
                                              border: Border.all(
                                                color: AppColors.bmiTracker,
                                                // Border color
                                                width: 1.5, // Border width
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 290,
                                            padding: EdgeInsets.only(left: 20),
                                            margin: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: TextField(
                                              controller: task3Controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  labelText: "Task 3",
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    state.no_of_tasks! > 3
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Rounded corners
                                              border: Border.all(
                                                color: AppColors.bmiTracker,
                                                // Border color
                                                width: 1.5, // Border width
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 290,
                                            padding: EdgeInsets.only(left: 20),
                                            margin: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: TextField(
                                              controller: task4Controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  labelText: "Task 4",
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    state.no_of_tasks! > 4
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Rounded corners
                                              border: Border.all(
                                                color: AppColors.bmiTracker,
                                                // Border color
                                                width: 1.5, // Border width
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 290,
                                            padding: EdgeInsets.only(left: 20),
                                            margin: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: TextField(
                                              controller: task5Controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  labelText: "Task 5",
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    state.no_of_tasks! > 5
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Rounded corners
                                              border: Border.all(
                                                color: AppColors.bmiTracker,
                                                // Border color
                                                width: 1.5, // Border width
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 290,
                                            padding: EdgeInsets.only(left: 20),
                                            margin: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: TextField(
                                              controller: task6Controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  labelText: "Task 6",
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    state.no_of_tasks! > 6
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Rounded corners
                                              border: Border.all(
                                                color: AppColors.bmiTracker,
                                                // Border color
                                                width: 1.5, // Border width
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: 290,
                                            padding: EdgeInsets.only(left: 20),
                                            margin: EdgeInsets.only(
                                                top: 40, bottom: 20),
                                            child: TextField(
                                              controller: task7Controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  labelText: "Task 7",
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    state.no_of_tasks! < 7
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Add your button click logic here
                                                  this
                                                      .getCubit(context)
                                                      .increaseTasks(
                                                          state.no_of_tasks);
                                                },
                                                child: Icon(Icons.add),
                                                // Use the Icons.add for the '+' symbol
                                                style: ElevatedButton.styleFrom(
                                                  shape: CircleBorder(),
                                                  // Make it a circular button
                                                  padding: EdgeInsets.all(
                                                      16.0), // Adjust padding as needed
                                                ),
                                              )
                                            ],
                                          )
                                        : Container(),
                                    Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            createChallenge(
                                                context,
                                                state.no_of_days!,
                                                state.no_of_tasks!,
                                                state.privacy!);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage(goRouterState: GoRouterState(), pageContext: context,)));
                                            showSnackBar(
                                                context, 'Challenge created!');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 80.0,
                                                vertical: 10.0),
                                            primary: AppColors.bmiTracker,
                                          ),
                                          child: Text(
                                            'Create challenge',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Fonts.fontSize20),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    );
                  },
                ));
          },
        ));
  }

  @override
  CreateChallengeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    CreateChallengeScreenCubit cubit = CreateChallengeScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
