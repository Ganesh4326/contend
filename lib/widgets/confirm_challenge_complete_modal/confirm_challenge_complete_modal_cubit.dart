import 'package:bloc/bloc.dart';
import 'package:contend/core/blocs/base_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/modals/base_modal/base_modal_cubit.dart';
import '../../core/models/common/boolean_status.dart';

part 'confirm_challenge_complete_modal_state.dart';

part 'confirm_challenge_complete_modal_cubit.freezed.dart';

class ConfirmChallengeCompleteModalCubit
    extends BaseModalCubit<ConfirmChallengeCompleteModalState> {
  ConfirmChallengeCompleteModalCubit({required super.context})
      : super(initialState: ConfirmChallengeCompleteModalState.initial());

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
