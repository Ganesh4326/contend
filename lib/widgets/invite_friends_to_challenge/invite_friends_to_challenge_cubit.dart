import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/modals/base_modal/base_modal_cubit.dart';
import '../../core/models/common/boolean_status.dart';


part 'invite_friends_to_challenge_state.dart';

part 'invite_friends_to_challenge_cubit.freezed.dart';

class InviteFriendsToChallengeCubit
    extends BaseModalCubit<InviteFriendsToChallengeState> {
  InviteFriendsToChallengeCubit({required super.context})
      : super(initialState: InviteFriendsToChallengeState.initial());

  @override
  void closeModal() {
    // TODO: implement closeModal
  }

  @override
  void openModal() {
    emitState(state.copyWith(modalStatus: BooleanStatus.active));
  }

  @override
  void openModalManual() {
    emitState(state.copyWith(modalStatus: BooleanStatus.pending));
  }

}
