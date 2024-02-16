import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/modals/base_modal/base_modal_cubit.dart';
import '../../core/models/common/boolean_status.dart';


part 'challenge_user_comment_section_modal_state.dart';

part 'challenge_user_comment_section_modal_cubit.freezed.dart';

class ChallengeUserCommentSectionModalCubit
    extends BaseModalCubit<ChallengeUserCommentSectionModalState> {
  ChallengeUserCommentSectionModalCubit({required super.context})
      : super(initialState: ChallengeUserCommentSectionModalState.initial());

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
