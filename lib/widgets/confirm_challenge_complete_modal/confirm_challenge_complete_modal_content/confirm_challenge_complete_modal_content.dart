import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/modals/base_modal_content/base_modal_content_widget.dart';
import '../../../core/models/common/boolean_status.dart';
import '../../../core/models/modal_data.dart';
import '../../../services/fire_store.dart';
import '../../../styles/edge_insets.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../confirm_challenge_complete_modal_data.dart';
import 'confirm_challenge_complete_modal_content_controller.dart';
import 'confirm_challenge_complete_modal_content_cubit.dart';

class ConfirmChallengeCompleteModalContent extends BaseModalContent<
    ConfirmChallengeCompleteModalContentController,
    ConfirmChallengeCompleteModalContentCubit,
    ConfirmChallengeCompleteModalContentState,
    ConfirmChallengeCompleteModalData> {
  String userId;
  String challengeId;

  ConfirmChallengeCompleteModalContent(
      {Key? key,
      super.controller,
      super.onStateChanged,
      required this.userId,
      required this.challengeId})
      : super(key: key);

  final FireStoreService fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfirmChallengeCompleteModalContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ConfirmChallengeCompleteModalContentCubit,
          ConfirmChallengeCompleteModalContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.2,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    margin: edge_insets_x_24_y_17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "",
                          style: TextStyle(
                            fontWeight: Fonts.f600,
                            fontSize: Fonts.fontSize22,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            closeModal(context,
                                ModalData(status: BooleanStatus.closed));
                          },
                          child: Icon(
                            Icons.close,
                            color: AppColors.grey1,
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                      child: state.image == null
                          ? Text('No image selected.')
                          : Column(
                              children: [
                                Image.file(
                                  state.image!,
                                  width: 400,
                                  height: 300,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 50, right: 50, top: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontFamily: Fonts.fontNunito,
                                                  fontSize: Fonts.fontSize14))),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await fireStoreService.updateCoins(
                                              userId, 10);
                                          await fireStoreService
                                              .addChallengeToDailyChallenges(
                                                  challengeId, userId);
                                          await FireStoreService()
                                              .reduceDaysLeft(
                                                  userId, challengeId);
                                          closeModal(
                                              context,
                                              ModalData(
                                                  status: BooleanStatus.success,
                                                  data:
                                                      ConfirmChallengeCompleteModalData()));
                                        },
                                        child: Text(
                                          "Yes, completed",
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontFamily: Fonts.fontNunito,
                                              fontSize: Fonts.fontSize14),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.deepPurple,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  getCubit(context).getImage();
                },
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  ConfirmChallengeCompleteModalContentCubit createCubitAndAssignToController(
      BuildContext context) {
    ConfirmChallengeCompleteModalContentCubit cubit =
        ConfirmChallengeCompleteModalContentCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
