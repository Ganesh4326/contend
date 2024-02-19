import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/blocs/base_cubit.dart';


part 'invite_friends_to_challenge_content_state.dart';

part 'invite_friends_to_challenge_content_cubit.freezed.dart';

class InviteFriendsToChallengeContentCubit
    extends BaseCubit<InviteFriendsToChallengeContentState> {
  InviteFriendsToChallengeContentCubit({required super.context})
      : super(initialState: InviteFriendsToChallengeContentState.initial());
}
