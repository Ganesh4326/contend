part of 'create_order_screen_cubit.dart';

@freezed
class CreateOrderScreenState with _$CreateOrderScreenState {
  const factory CreateOrderScreenState.initial({
    List<Orders>? allOrders,
}) = _Initial;
}
