import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../core/modals/base_modal/base_modal_widget.dart';
import 'package:go_router/go_router.dart';
import 'challenge_user_comment_section_modal_content/challenge_user_comment_section_modal_content.dart';
import 'challenge_user_comment_section_modal_controller.dart';
import 'challenge_user_comment_section_modal_cubit.dart';
import 'challenge_user_comment_section_modal_data.dart';


class ChallengeUserCommentSectionModal
    extends BaseModalWidget<
        ChallengeUserCommentSectionModalController,
        ChallengeUserCommentSectionModalCubit,
        ChallengeUserCommentSectionModalState,
        ChallengeUserCommentSectionModalData> {
  String? challengeId;

  ChallengeUserCommentSectionModal(
      {Key? key, super.controller, super.onStateChanged, super.onModalClosed, required this.challengeId})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChallengeUserCommentSectionModalCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          ChallengeUserCommentSectionModalCubit,
          ChallengeUserCommentSectionModalState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            child: InkWell(
              onTap: (){
                openModal(context: context, cubit: getCubit(context));
              },
              child: Text("...Comments"),
            ),
          );
        },
      ),
    );
  }

  @override
  ChallengeUserCommentSectionModalCubit createCubitAndAssignToController(
      BuildContext context) {
    ChallengeUserCommentSectionModalCubit cubit = ChallengeUserCommentSectionModalCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getModalContentWidget({required BuildContext context}) {
    return ChallengeUserCommentSectionModalContent(challengeId: challengeId,);
  }
}
