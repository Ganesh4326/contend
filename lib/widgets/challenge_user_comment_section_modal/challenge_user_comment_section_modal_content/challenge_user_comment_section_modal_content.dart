import 'package:contend/core/models/common/boolean_status.dart';
import 'package:contend/core/models/modal_data.dart';
import 'package:contend/services/fire_store.dart';
import 'package:contend/styles/edge_insets.dart';
import 'package:contend/themes/app_colors.dart';
import 'package:contend/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/modals/base_modal_content/base_modal_content_widget.dart';
import 'package:go_router/go_router.dart';
import '../challenge_user_comment_section_modal_data.dart';
import 'challenge_user_comment_section_modal_content_controller.dart';
import 'challenge_user_comment_section_modal_content_cubit.dart';

class ChallengeUserCommentSectionModalContent extends BaseModalContent<
    ChallengeUserCommentSectionModalContentController,
    ChallengeUserCommentSectionModalContentCubit,
    ChallengeUserCommentSectionModalContentState,
    ChallengeUserCommentSectionModalData> {
  String? challengeId;

  ChallengeUserCommentSectionModalContent(
      {Key? key,
      super.controller,
      super.onStateChanged,
      required this.challengeId})
      : super(key: key);

  TextEditingController commentText = TextEditingController();
  final String assetImagePath = 'images/user3.png';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChallengeUserCommentSectionModalContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ChallengeUserCommentSectionModalContentCubit,
          ChallengeUserCommentSectionModalContentState>(
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
                          "Comments",
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      // Wrap input field and button in a Row
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commentText,
                            decoration: InputDecoration(
                              labelText: 'Write your comment here',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Add some spacing between input field and button
                        Container(
                          padding: edge_insets_y_4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.bmiTracker),
                          child: TextButton(
                            onPressed: () async {
                              getCubit(context)
                                  .postComment(await commentText.text);
                              commentText.clear();
                            },
                            child: Text(
                              "Post",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: Fonts.fontSize14,
                                  fontWeight: Fonts.f600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  (state.comments != null && state.comments!.isNotEmpty)
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: state.comments!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage('images/user3.png'),
                                ),
                                title: Text(state.comments![index].username),
                                subtitle: Text(state.comments![index].comment),
                              );
                            },
                          ),
                        )
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
                                    "No comments on this challenge!",
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
          );
        },
      ),
    );
  }

  @override
  ChallengeUserCommentSectionModalContentCubit createCubitAndAssignToController(
      BuildContext context) {
    ChallengeUserCommentSectionModalContentCubit cubit =
        ChallengeUserCommentSectionModalContentCubit(
            context: context, challengeId: challengeId);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
