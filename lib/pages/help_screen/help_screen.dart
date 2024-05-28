import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import '../../core/widgets/base_stateless_widget.dart';
import '../../themes/fonts.dart';
import 'help_screen_controller.dart';
import 'help_screen_cubit.dart';

class HelpScreen extends BaseStatelessWidget<HelpScreenController,
    HelpScreenCubit, HelpScreenState> {
  HelpScreen({super.key});

  TextEditingController feedbackController = TextEditingController();

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
    return BlocProvider<HelpScreenCubit>(
        create: (create) => createCubitAndAssignToController(context),
        child: BlocConsumer<HelpScreenCubit, HelpScreenState>(
          listener: (context, state) {},
          builder: (context, state) {
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
                        "Help",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: Fonts.fontNunito,
                            color: AppColors.bmiTracker,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Give Us Your Feedback',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: feedbackController,
                        decoration: InputDecoration(
                          hintText: 'Enter your feedback here...',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 4,
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          feedbackController.clear();
                          showSnackBar(context, 'Thanks for your feedback!');
                        },
                        child: Text('Submit'),
                      ),
                      SizedBox(height: 40.0),
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text('Email: challengeyourself@gmail.com'),
                      Text('Phone: +91 678-900-9641'),
                    ],
                  ),
                ),
              ],
            ));
          },
        ));
  }

  @override
  HelpScreenCubit createCubitAndAssignToController(BuildContext context) {
    HelpScreenCubit cubit = HelpScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
