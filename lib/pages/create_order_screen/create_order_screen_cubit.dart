import 'package:bloc/bloc.dart';
import 'package:contend/core/blocs/base_cubit.dart';
import 'package:contend/services/fire_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/logger/log.dart';
import '../../models/order.dart';

part 'create_order_screen_state.dart';

part 'create_order_screen_cubit.freezed.dart';

class CreateOrderScreenCubit extends BaseCubit<CreateOrderScreenState> {
  CreateOrderScreenCubit({required super.context}) : super(initialState:  CreateOrderScreenState.initial()) {
    getAllOrders();
  }

  getAllOrders() async {
    List<Orders> allOrders = await FireStoreService().getAllOrders();
    FireStoreService().getOrderData('');
    emitState(state.copyWith(allOrders: allOrders));
    logger.d(state.allOrders!.toList());
  }
}
