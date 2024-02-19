import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/modals/base_modal_content/base_modal_content_widget.dart';
import 'package:go_router/go_router.dart';
import '../invite_friends_to_challenge_data.dart';
import 'invite_friends_to_challenge_content_controller.dart';
import 'invite_friends_to_challenge_content_cubit.dart';

class InviteFriendsToChallengeContent extends BaseModalContent<
    InviteFriendsToChallengeContentController,
    InviteFriendsToChallengeContentCubit,
    InviteFriendsToChallengeContentState,
    InviteFriendsToChallengeData> {
  InviteFriendsToChallengeContent(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InviteFriendsToChallengeContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<InviteFriendsToChallengeContentCubit,
          InviteFriendsToChallengeContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
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
  InviteFriendsToChallengeContentCubit createCubitAndAssignToController(
      BuildContext context) {
    InviteFriendsToChallengeContentCubit cubit =
        InviteFriendsToChallengeContentCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
