import 'package:contend/services/fire_store.dart';
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
            // Use MediaQuery.of(context).size.width instead of MediaQuery.sizeOf(context).width
            height: MediaQuery.of(context).size.height / 1.2,
            // Adjust height as needed
            child: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: commentText,
                      decoration: InputDecoration(
                        labelText: 'Write your comment here',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    // Changed TextButton to ElevatedButton for better visibility
                    onPressed: () {
                      FireStoreService().addChallengeComment(
                        challengeId!,
                        'gani',
                        'nice!!',
                      );
                    },
                    child: Text("Post"),
                  ),
                  state.comments!.length>0?Expanded(
                    // Wrap the ListView.builder in an Expanded to allow it to take remaining space
                    child: ListView.builder(
                      itemCount: state.comments!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            'images/user2.png',
                            width: 50,
                            height: 50,
                          ),
                          title: Text(state.comments![index].username),
                          subtitle: Text(state.comments![index].comment),
                        );
                      },
                    ),
                  ):Container(),
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
