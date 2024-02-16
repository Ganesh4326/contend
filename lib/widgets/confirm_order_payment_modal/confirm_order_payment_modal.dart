import 'package:contend/themes/app_colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../core/modals/base_modal/base_modal_widget.dart';
import 'confirm_order_payment_modal_content/confirm_order_payment_modal_content.dart';
import 'confirm_order_payment_modal_controller.dart';
import 'confirm_order_payment_modal_cubit.dart';
import 'confirm_order_payment_modal_data.dart';

class ConfirmOrderPaymentModal extends BaseModalWidget<
    ConfirmOrderPaymentModalController,
    ConfirmOrderPaymentModalCubit,
    ConfirmOrderPaymentModalState,
    ConfirmOrderPaymentModalData> {
  ConfirmOrderPaymentModal(
      {Key? key, super.controller, super.onStateChanged, super.onModalClosed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfirmOrderPaymentModalCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ConfirmOrderPaymentModalCubit,
          ConfirmOrderPaymentModalState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.bmiTracker,
                        side: BorderSide(width: 1.0, color: AppColors.bmiTracker)
                    ),
                    onPressed: () {
                      openModal(context: context, cubit: getCubit(context));
                    },
                    child: Text('Buy')),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  ConfirmOrderPaymentModalCubit createCubitAndAssignToController(
      BuildContext context) {
    ConfirmOrderPaymentModalCubit cubit =
        ConfirmOrderPaymentModalCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getModalContentWidget({required BuildContext context}) {
    return ConfirmOrderPaymentModalContent();
  }
}
