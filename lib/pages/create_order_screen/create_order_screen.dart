import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contend/core/widgets/base_stateless_widget.dart';
import 'package:contend/pages/create_order_screen/create_order_screen_cubit.dart';
import 'package:contend/themes/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/order.dart';
import '../../styles/edge_insets.dart';
import '../../themes/app_colors.dart';
import '../../themes/fonts.dart';
import '../../widgets/confirm_order_payment_modal/confirm_order_payment_modal.dart';

class CreateOrderScreen extends BaseStatelessWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateOrderScreenCubit>(
      create: (create) => createCubitAndAssignToController(context),
      child: BlocConsumer<CreateOrderScreenCubit, CreateOrderScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Directionality(
              textDirection: TextDirection.ltr,
              child: Builder(
                builder: (context) => Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/home');
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: AppColors.bmiTracker,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Order here",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: Fonts.fontNunito,
                                      color: AppColors.bmiTracker,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          state.allOrders != null
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.allOrders!.length,
                                  itemBuilder: (context, index) {
                                    Orders order = state.allOrders![index];
                                    return Container(
                                      margin: edge_insets_t_16,
                                      decoration: BoxDecoration(
                                          borderRadius: borderRadius.br_10,
                                          border: borders.b_1px_grey2),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: edge_insets_16,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Image.network(
                                                      order.imageUrl,
                                                      width: 100,
                                                      height: 100,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${order.itemName}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                Fonts.f600,
                                                            fontSize: Fonts
                                                                .fontSize18),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: 20,
                                                            color: AppColors
                                                                .orange,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            "4.2",
                                                            style: TextStyle(
                                                              fontSize: Fonts
                                                                  .fontSize14,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Quantity left: ",
                                                            style: TextStyle(
                                                                fontSize: Fonts
                                                                    .fontSize14,
                                                                color: AppColors
                                                                    .grey1),
                                                          ),
                                                          Text(
                                                            order.quantityLeft
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: Fonts
                                                                  .fontSize14,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Coins needed: ",
                                                            style: TextStyle(
                                                                fontSize: Fonts
                                                                    .fontSize14,
                                                                color: AppColors
                                                                    .grey1),
                                                          ),
                                                          Text(
                                                            order.coinsReq
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: Fonts
                                                                  .fontSize14,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Amount :",
                                                            style: TextStyle(
                                                                fontSize: Fonts
                                                                    .fontSize14,
                                                                color: AppColors
                                                                    .grey1),
                                                          ),
                                                          Text(
                                                            "Rs.${order.itemPrice.toString()}",
                                                            style: TextStyle(
                                                              fontSize: Fonts
                                                                  .fontSize14,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Container(
                                                  margin: edge_insets_t_16,
                                                  child:
                                                      ConfirmOrderPaymentModal())
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Container(
                                  margin: edge_insets_t_70,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/illustration.jpeg',
                                        width: 200,
                                        height: 200,
                                      )
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  @override
  CreateOrderScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    CreateOrderScreenCubit cubit = CreateOrderScreenCubit();
    controller?.cubit = cubit;
    return cubit;
  }
}
