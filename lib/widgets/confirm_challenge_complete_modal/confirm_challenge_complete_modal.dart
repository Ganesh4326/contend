import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/modals/base_modal/base_modal_widget.dart';
import '../../core/models/common/boolean_status.dart';
import 'confirm_challenge_complete_modal_content/confirm_challenge_complete_modal_content.dart';
import 'confirm_challenge_complete_modal_controller.dart';
import 'confirm_challenge_complete_modal_cubit.dart';
import 'confirm_challenge_complete_modal_data.dart';

class ConfirmChallengeCompleteModal extends BaseModalWidget<
    ConfirmChallengeCompleteModalController,
    ConfirmChallengeCompleteModalCubit,
    ConfirmChallengeCompleteModalState,
    ConfirmChallengeCompleteModalData> {
  String userId;
  String challengeId;

  ConfirmChallengeCompleteModal(
      {Key? key,
      super.controller,
      super.onStateChanged,
      super.onModalClosed,
      required this.userId,
      required this.challengeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfirmChallengeCompleteModalCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ConfirmChallengeCompleteModalCubit,
          ConfirmChallengeCompleteModalState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
          if (state.modalStatus == BooleanStatus.pending) {
            openModal(context: context, cubit: getCubit(context));
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container();
        },
      ),
    );
  }

  @override
  ConfirmChallengeCompleteModalCubit createCubitAndAssignToController(
      BuildContext context) {
    ConfirmChallengeCompleteModalCubit cubit =
        ConfirmChallengeCompleteModalCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getModalContentWidget({required BuildContext context}) {
    return ConfirmChallengeCompleteModalContent(userId: userId, challengeId: challengeId,);
  }
}
