import 'package:contend/core/models/common/boolean_status.dart';
import 'package:contend/core/models/modal_data.dart';
import 'package:contend/styles/edge_insets.dart';
import 'package:contend/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/modals/base_modal_content/base_modal_content_widget.dart';
import '../../../themes/app_colors.dart';
import '../confirm_order_payment_modal_data.dart';
import 'confirm_order_payment_modal_content_controller.dart';
import 'confirm_order_payment_modal_content_cubit.dart';

class ConfirmOrderPaymentModalContent extends BaseModalContent<
    ConfirmOrderPaymentModalContentController,
    ConfirmOrderPaymentModalContentCubit,
    ConfirmOrderPaymentModalContentState,
    ConfirmOrderPaymentModalData> {
  ConfirmOrderPaymentModalContent(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfirmOrderPaymentModalContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ConfirmOrderPaymentModalContentCubit,
          ConfirmOrderPaymentModalContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            width: MediaQuery.sizeOf(context).width / 1,
            height: MediaQuery.sizeOf(context).height / 1.2,
            child: Column(
              children: [
                Container(
                  margin: edge_insets_t_28,
                  padding: edge_insets_x_24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Fonts.fontSize22),
                      ),
                      InkWell(
                          onTap: () {
                            closeModal(
                                context,
                                ModalData(
                                    status: BooleanStatus.closed, data: null));
                          },
                          child: Icon(Icons.close))
                    ],
                  ),
                ),
                Container(
                  padding: edge_insets_x_24,
                  margin: edge_insets_t_70,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.bmiTracker,
                                side: BorderSide(
                                    width: 1.0, color: AppColors.bmiTracker)),
                            onPressed: () {},
                            child: Text('Continue with 100 coins')),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: edge_insets_y_16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Or")],
                  ),
                ),
                Container(
                  padding: edge_insets_x_30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'images/phonepe.png',
                        width: 50,
                        height: 50,
                      ),
                      Image.asset(
                        'images/gpay.png',
                        width: 50,
                        height: 50,
                      ),
                      Image.asset(
                        'images/paytm.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: edge_insets_x_24,
                  margin: edge_insets_t_56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter card details",
                        style: TextStyle(fontSize: Fonts.fontSize18),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: edge_insets_x_24,
                  margin: edge_insets_t_24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cash on delivery",
                        style: TextStyle(fontSize: Fonts.fontSize18),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 18,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: edge_insets_x_24,
                  margin: edge_insets_t_170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.grey1,
                              side: BorderSide(
                                  width: 1.0, color: AppColors.grey1)),
                          onPressed: () {
                            closeModal(
                                context,
                                ModalData(
                                    status: BooleanStatus.closed, data: null));
                          },
                          child: Text('Cancel')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  ConfirmOrderPaymentModalContentCubit createCubitAndAssignToController(
      BuildContext context) {
    ConfirmOrderPaymentModalContentCubit cubit =
        ConfirmOrderPaymentModalContentCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
