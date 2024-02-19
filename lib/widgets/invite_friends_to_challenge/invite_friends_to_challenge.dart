import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/modals/base_modal/base_modal_widget.dart';
import 'invite_friends_to_challenge_content/invite_friends_to_challenge_content.dart';
import 'invite_friends_to_challenge_controller.dart';
import 'invite_friends_to_challenge_cubit.dart';
import 'invite_friends_to_challenge_data.dart';


class InviteFriendsToChallenge
    extends BaseModalWidget<
        InviteFriendsToChallengeController,
        InviteFriendsToChallengeCubit,
        InviteFriendsToChallengeState,
        InviteFriendsToChallengeData> {
  InviteFriendsToChallenge(
      {Key? key, super.controller, super.onStateChanged, super.onModalClosed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InviteFriendsToChallengeCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          InviteFriendsToChallengeCubit,
          InviteFriendsToChallengeState>(
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
  InviteFriendsToChallengeCubit createCubitAndAssignToController(
      BuildContext context) {
    InviteFriendsToChallengeCubit cubit = InviteFriendsToChallengeCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getModalContentWidget({required BuildContext context}) {
    return InviteFriendsToChallengeContent();
  }
}
