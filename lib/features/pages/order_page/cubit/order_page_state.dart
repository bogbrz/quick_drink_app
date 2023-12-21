part of 'order_page_cubit.dart';

@freezed
class OrderPageState with _$OrderPageState {


  factory OrderPageState({
    required String errorMessage,
    required List<OrderModel> orders,
    required double orderValue,
  }) = _OrderPageState;
}
