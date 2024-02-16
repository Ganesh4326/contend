import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/modals/base_modal/base_modal_cubit.dart';
import '../../core/models/common/boolean_status.dart';

part 'confirm_order_payment_modal_state.dart';

part 'confirm_order_payment_modal_cubit.freezed.dart';

class ConfirmOrderPaymentModalCubit
    extends BaseModalCubit<ConfirmOrderPaymentModalState> {
  ConfirmOrderPaymentModalCubit({required super.context})
      : super(initialState: ConfirmOrderPaymentModalState.initial());

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
