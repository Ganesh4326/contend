import 'package:bloc/bloc.dart';
import 'package:contend/auth/AuthService.dart';
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
    getUserName();
    getChallengeComments();
  }

  getUserName() async {
    String? userId = await AuthService.getUserId();
    await getUserNameFromFirebase(userId!);
  }

  getUserNameFromFirebase(String userId) async {
    String userName = await FireStoreService().getUserNameFromFirebase(userId);
    emitState(state.copyWith(userName: userName));
    logger.d(state.userName!);
  }

  getChallengeComments() async {
    List<ChallengeComment> comments =
        await FireStoreService().getChallengeComments(state.challengeId!);
    logger.d(comments.toList());
    emitState(state.copyWith(comments: comments));
    logger.d(state.comments![0].username);
  }

  postComment(String? comment) async {
    logger.d(comment);
    await FireStoreService().addChallengeComment(
      state.challengeId!,
      state.userName!,
      comment!,
    );
    getChallengeComments();
  }
}
