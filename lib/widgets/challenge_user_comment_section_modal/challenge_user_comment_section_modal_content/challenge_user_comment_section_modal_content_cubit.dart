import 'package:bloc/bloc.dart';
import 'package:contend/services/fire_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/blocs/base_cubit.dart';
import '../../../core/logger/log.dart';
import '../../../models/ChallengeComment.dart';

part 'challenge_user_comment_section_modal_content_state.dart';

part 'challenge_user_comment_section_modal_content_cubit.freezed.dart';

class ChallengeUserCommentSectionModalContentCubit
    extends BaseCubit<ChallengeUserCommentSectionModalContentState> {
  ChallengeUserCommentSectionModalContentCubit(
      {required super.context, String? challengeId})
      : super(
            initialState: ChallengeUserCommentSectionModalContentState.initial(
                challengeId: challengeId, comments: [])) {
    getChallengeComments();
  }

  getChallengeComments() async {
    List<ChallengeComment> comments =
        await FireStoreService().getChallengeComments(state.challengeId!);
    logger.d(comments.toList());
    emitState(state.copyWith(comments: comments));
    logger.d(comments[0].username);
  }
}
