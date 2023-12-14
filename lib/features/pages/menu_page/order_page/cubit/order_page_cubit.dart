import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';
import 'package:quick_drink_app/domain/repositories/pre_order_repository.dart';

part 'order_page_state.dart';

class OrderPageCubit extends Cubit<OrderPageState> {
  OrderPageCubit({required this.preOrdersRepository})
      : super(
          OrderPageState(
            orderValue: 0,
            orders: [],
            errorMessage: "",
          ),
        );

  final PreOrdersRepository preOrdersRepository;
  StreamSubscription? streamSubscription;

  Future<void> getPreOrder({required int tableNumber}) async {
    double value = 0;
    streamSubscription = preOrdersRepository
        .getPreOrder(tableNumber: tableNumber)
        .listen((orders) {
      for (final order in orders) {
        value = value + order.orderPrice;
      }
      emit(OrderPageState(
        orderValue: value,
        errorMessage: '',
        orders: orders,
      ));
    })
      ..onError((error) {
        emit(OrderPageState(
            errorMessage: error.toString(), orders: [], orderValue: 0));
      });
  }

  Future<void> addOrder({
    required String type,
    required int tableNumber,
    required String name,
    required int quantity,
    required double orderPrice,
  }) async {
    preOrdersRepository.addOrder(
      type: type,
      name: name,
      orderPrice: orderPrice,
      tableNumber: tableNumber,
      quantity: quantity,
    );
  }

  Future<void> removePreOrder({required String id}) async {
    preOrdersRepository.removePreOrder(id: id);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
