import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/blocs/base_cubit.dart';


part 'confirm_order_payment_modal_content_state.dart';

part 'confirm_order_payment_modal_content_cubit.freezed.dart';

class ConfirmOrderPaymentModalContentCubit
    extends BaseCubit<ConfirmOrderPaymentModalContentState> {
  ConfirmOrderPaymentModalContentCubit({required super.context})
      : super(initialState: ConfirmOrderPaymentModalContentState.initial());
}
