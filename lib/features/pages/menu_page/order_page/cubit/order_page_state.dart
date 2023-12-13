part of 'order_page_cubit.dart';

class OrderPageState {
  final String errorMessage;
  final List<OrderModel> orders;
  final double orderValue;

  OrderPageState({
    required this.errorMessage,
    required this.orders,
    required this.orderValue,
  });
}
