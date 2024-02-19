part of 'challenge_user_comment_section_modal_content_cubit.dart';

@freezed
class ChallengeUserCommentSectionModalContentState
    with _$ChallengeUserCommentSectionModalContentState {
  const factory ChallengeUserCommentSectionModalContentState.initial({
    String? challengeId,
    List<ChallengeComment>? comments,
    String? userName
}) = _Initial;
}
